// Creates a Liquid object which is repredented by ocean
Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);

// Creates a list to store the Walker objects
ArrayList<Walker> walkerList = new ArrayList<>();

int numWalkers = 10; // Sets the number of walkers

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  // Calculate how much space should be between each walker
  float spacing = (Window.right - Window.left) / (numWalkers + 5); 

  // For loop to create walkers
  for (int i = 1; i <= numWalkers; i++)
  {
    float posX = Window.left + spacing * (i + 1); // Distribute walkers evenly from left to right
    float posY = 500; // Position 500 pixels below the top of the screen 
    float mass = map(i, 0, numWalkers - 1, 5, 1.5); // Assigns mass for each walker
    Walker walker = new Walker(mass, posX, posY); // Create a new walker with mass and initial position 
    walkerList.add(walker); // Adds a walker to the list
  }
}

void draw()
{
  background(255); // Sets the background to white

  ocean.render(); // Renders the liquid

  for (Walker walker : walkerList)
  {
    PVector gravity = new PVector(0, -0.15f * walker.mass);  // Sets the gravity scaled by mass
    walker.applyForce(gravity); // Apply gravity force to the walker

    PVector wind = new PVector(0.1f, 0); // Sets the wind force
    walker.applyForce(wind); // Apply wind force
    
    walker.render(); // Render the walker
    walker.update(); // Update walker's position and velocity

    // Check if the walker is colliding with the liquid and apply drag only then
    if (ocean.isCollidingWith(walker)) {
      PVector dragForce = ocean.calculateDragForce(walker); // Calculate drag force if colliding
      walker.applyForce(dragForce); // Apply drag force to the walker
    }

    walker.checkEdges(); // Check for edge collisions and adjust position/velocity
  }
}
