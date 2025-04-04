class BlackHole 
{
  PVector position; // Declares position of the Black Hole
  float scale = 50; // Fixed size of the Black Hole
  
  // Initializes the Black Hole
  BlackHole() 
  {
    // Spawn the black hole at a random position within the screen
    position = new PVector(random(0, Window.widthPx), random(0, Window.heightPx));
  }
  
  // Update method to make the Black Hole follow the mouse cursor
  void update(float x, float y) 
  {
    position.set(constrain(x, 0, Window.widthPx), constrain(Window.heightPx - y, 0, Window.heightPx));
  }
  
  // Render method to draw the Black Hole
  void render() 
  {
    fill(255);
    circle(position.x, position.y, scale);
  }
}
