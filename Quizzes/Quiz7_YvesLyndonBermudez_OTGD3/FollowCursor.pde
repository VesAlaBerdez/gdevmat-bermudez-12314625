class FollowCursor 
{
  PVector position; // Declares position of the cursor follower

  FollowCursor() 
  {
    position = new PVector(); // Initialize position
  }

  // Updates the cursor position, applies the y-inverted offset
  void update(float x, float y) 
  {
    // Adjusted to follow the cursor
    position.set(constrain(x - 315, 0, Window.widthPx), constrain(Window.heightPx - (y + 190), 0, Window.heightPx));
  }  
}
