// ArrayList to store multiple Walker objects
ArrayList<Walker> walkerList = new ArrayList<>();

// Define forces where Gravity pulls downward, Wind pushes right
PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void setup()
{
  size(1280, 720, P3D); 
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0); 

  // Initialize 10 Walker objects with different masses ranging from 1 to 10
  for (int i = 1; i <= 10; i++) 
  {
    Walker walker = new Walker(i); // Create a Walker with mass
    walkerList.add(walker); // Add Aalkers to the list
  }
} 

void draw()
{
  background(80); // Clear screen with dark gray background
  
  // Sort circles by scale by having the smallest appear in-front then the biggest behind 
  walkerList.sort((a, b) -> Float.compare(b.scale, a.scale)); 
  
  // Loops through each Walker object 
  for (Walker walker : walkerList)
  {
    walker.applyForce(wind); // Applies wind force
    walker.applyForce(gravity); // Applies gravity force
    walker.update(); // Updates Walker's movement
    walker.checkEdges(); // Check then bounce if Wlaker hits screen edges
    walker.render(); // Draw Walker on screen
  }
}
