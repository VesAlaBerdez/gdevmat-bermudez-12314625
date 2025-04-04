// Creates the RandomSpaltter
RandomSplatter randomSplatter = new RandomSplatter();

int frameReset = 300; // Sets the frame limit before flushing the screen

void setup() 
{
 size(1020, 720, P3D); // Set canvas size 
 camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 100, 0, 0, -1, 0); // Sets camera position
 background(0); //Sets the background
}

void draw() 
{
  if (frameCount % frameReset == 0) // For every 300 frames
  {
    background(0); // Flushes the Screen
  }
  randomSplatter.splatter(); // Draws or Runs the Paint Random Splatter Animation
}
