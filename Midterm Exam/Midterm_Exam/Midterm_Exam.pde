// List to store matter
ArrayList<Matter> matterList = new ArrayList<>();
// Declare a Black Hole 
BlackHole blackHole;
// Sets the number of frames before resetting the program
int frameReset = 300;

void setup() 
{
  // Set up the window size
  size(1920, 1080, P3D);
  camera(Window.windowWidth / 2, Window.windowHeight / 2, Window.eyeZ, Window.windowWidth / 2, Window.windowHeight / 2, 0, 0, -1, 0);
  
  // Initialize the Black Hole
  blackHole = new BlackHole();
  
  // Spawn the initial set of Matter objects
  spawnMatter();
}

void draw() {
  // Reset the simulation every certain number of frames
  if (frameCount % frameReset == 0) 
  {
    background(0);
    spawnMatter();
  }
  
  // Clear the background every frame
  background(0);
  
  // Update the Black Hole's position to follow the mouse
  blackHole.update(mouseX, mouseY);
  
  // Update and render each Matter object
  for (int i = matterList.size() - 1; i >= 0; i--) 
  {
  Matter m = matterList.get(i);
  
  // Move the Matter objects towards the black hole
  m.moveTowards(blackHole);

  // Removes matter if it is too close to the black hole
  if (m.position.dist(blackHole.position) < blackHole.scale / 2) 
  {
    matterList.remove(i); // Remove the matter from the list
  } else {
    // If the matter is not too close, Render it unless it's behind the black hole
    if (m.position.dist(blackHole.position) >= blackHole.scale / 2) 
    {
      m.render(); 
    }
  }
}
// Render the black hole last to ensure it appears on top of everything
blackHole.render();
}

// Function to clear and respawn Matter objects
void spawnMatter() 
{
  matterList.clear(); // Clears the existing list
  for (int i = 0; i < 100; i++) 
  {
    matterList.add(new Matter()); // Adds new Matter objects
  }
}
