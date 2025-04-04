// List to store Walker objects
ArrayList<Walker> walkerList = new ArrayList<>();
FollowCursor followCursor; // Creates Follow Cursor object

void setup() 
{
  size(1280, 720, P3D);
  camera(Window.windowWidth / 2, Window.windowHeight / 2, Window.eyeZ, Window.windowWidth / 2, Window.windowHeight / 2, 0, 0, -1, 0);

  followCursor = new FollowCursor(); // Initializes the Follow Cursor
  spawnWalker(); // Spawns 100 Walker instances
}

void draw() 
{
  background(87);  // Clear the screen with a Dark Gray background
  
  // Update the cursor tracker
  followCursor.update(mouseX, mouseY);
  
   // Iterates through all Walkers
  for (Walker m : walkerList) 
  {
    m.moveTowards(followCursor); // Apply Movement Logic for the Walkers to follow the Cursor
    m.update(); // Update velocity and position
    m.render(); // Draws the Walker on screen
  }
}


// Spawns 100 Walkers with random positions and scales
void spawnWalker() 
{
  walkerList.clear(); // Clear existing walkers
  for (int i = 0; i < 100; i++) 
  {
    walkerList.add(new Walker()); // Add new Walker objects
  }
}
