class Walker 
{
  // Declare the PVector Variables
  PVector position = new PVector();
  PVector speed = new PVector(5, 8);
  
  void render()
  {
  // Declare the color, position, and size of Circle
  fill(182, 52, 100);
  circle(position.x, position.y, 50); 
  }
  
  void moveAndBounce()
  {
    // Add speed to the current position
  position.add(speed);
  
  // Conditions for bouncing
  if ((position.x > Window.right) || (position.x < Window.left))
  {
    speed.x *= -1;
  }
  
  if ((position.y > Window.top) || (position.y < Window.bottom))
  {
    speed.y *= -1;
  }
    
  }
}
