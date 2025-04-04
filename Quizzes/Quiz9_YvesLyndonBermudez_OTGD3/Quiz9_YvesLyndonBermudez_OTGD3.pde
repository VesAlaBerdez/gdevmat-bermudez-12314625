// ArrayList to store multiple Walker objects
ArrayList<Walker> walkerList = new ArrayList<>();

// Sets the number of walkers to create
int numWalkers = 8;

void setup()
{
  size(1280, 720, P3D); 
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0); 

  // For loop to initialize the 8 walkers
  for (int i = 1; i <= numWalkers; i++) 
  {
    float posY = 2 * (Window.heightPx / numWalkers) * (i - (numWalkers / 2)); // Calculates vertical position using formula
    posY *= 0.4; // Brings the walkers closer vertically without changing the original formula

    Walker walker = new Walker(i, posY); // Create a new walker with increasing mass and position
    walkerList.add(walker); // Adds a walker to the list
  }
} 

void draw()
{
  background(255); // Clear the background with dark gray color
  
  // Draw a black vertical line at the middle of the screen
  stroke(0);          
  strokeWeight(2);    
  line(0, Window.bottom, 0, Window.top); 

  PVector accel = new PVector(0.2, 0); // Declares a constant acceleration force to the right 

  // For loop through each walker and apply physics behavior
  for (Walker walker : walkerList)
  {
    walker.applyForce(PVector.mult(accel, walker.mass)); // Apply acceleration based on mass (F = ma → a = F / m)

    float mew = (walker.position.x > 0) ? 0.4f : 0.01f; // Define coefficient of friction that becomes stronger after midpoint

    PVector friction = walker.velocity.copy(); // Copi current velocity
    friction.normalize(); // Normalizes friction into unit vector
    friction.mult(-1); // Reverses direction
    friction.mult(mew); // Set to scale by friction coefficient

    walker.applyForce(friction); // Apply the friction force
    walker.update(); // Update movement
    walker.checkEdges(); //Checks if the circle at the edge then bounces
    walker.render(); // Draws the Walker
  }
}

// When mouse is clicked, reset all walkers
void mousePressed()
{
  walkerList.clear(); // Removes all existing walkers

  // Reinitialize 8 new walkers
  for (int i = 1; i <= numWalkers; i++) 
  {
    float posY = 2 * (Window.heightPx / numWalkers) * (i - (numWalkers / 2));  // Calculates vertical position using formula
    posY *= 0.4; // Brings the walkers closer vertically without changing the original formula
    
    Walker walker = new Walker(i, posY); // Create a new walker with increasing mass and position
    walkerList.add(walker); // Adds a walker to the list
  }
}
