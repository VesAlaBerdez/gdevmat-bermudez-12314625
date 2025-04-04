// Creates a Walker
Walker myWalker;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // Initializes the Walker
  myWalker = new Walker(); 
}

void draw()
{
  // Flush the Screen with white background
  background(255);
  
  // Render the Circle
  myWalker.moveAndBounce();
  myWalker.render();
}
