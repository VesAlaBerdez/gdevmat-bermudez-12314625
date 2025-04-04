// Create two Walker
Walker walker1 = new Walker();
Walker walker2 = new Walker();

void setup() 
{
  size(1020, 720, P3D); // Set canvas size 
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0); // Sets camera position
}

void draw() 
{
  walker1.randomWalk(); // Move walker1 randomly
  walker1.render(); // Draws walker1
  
  walker2.randomWalkBiased(); // Move walker2 with biased movement
  walker2.render(); // Draws walker2
}
