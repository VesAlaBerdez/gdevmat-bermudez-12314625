// Creates a list to store the Walker objects
ArrayList<Walker> walkerList = new ArrayList<>();

int numWalkers = 10; // Sets the number of walkers

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // For loop to create walkers
  for (int i = 1; i <= numWalkers; i++)
  {
    float posX = random(Window.left, Window.right); //  Position walkers randomly from left to right
    float posY = random(Window.bottom, Window.top); //  Position walkers randomly from top to bottom 
    float mass = map(i, 0, numWalkers - 1, 5, 1.5); // Assigns mass for each walker based on their index 
    Walker walker = new Walker(mass, posX, posY); // Create a new walker with mass and initial position 
    walkerList.add(walker); // Adds a walker to the list
  }
} 

void draw()
{
  background(255); // Clear the screen with a white background
  
  // For loop through each walker to calculate attraction to all other walkers
  for (int i = 0; i < walkerList.size(); i++) // Outer loop to go through each walker
  {
    Walker walker1 = walkerList.get(i); // The walker that is being considered
    
    for (int j = 0; j < walkerList.size(); j++)
    {
      if (i != j) // Skips self-attraction
      {
        Walker walker2 = walkerList.get(j); // The walker to which we are applying the force
        PVector attraction = walker1.calculateAttraction(walker2); // Calculate the gravitational force from walker2 to walker1
        walker1.applyForce(attraction); // Apply the calculated attraction force
      }
    }
    walker1.render(); // Render the walker
    walker1.update(); // Update walker's position and velocity
  }
}
