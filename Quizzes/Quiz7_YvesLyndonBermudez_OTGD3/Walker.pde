class Walker 
{
  PVector position; // Declares current position
  PVector velocity; // Declares movement velocity
  PVector acceleration; // Declares acceleration 
  float velocityLimit = 10; // Sets the maximum speed limit
  float scale; // Sets the size of the Walker

  Walker() // Constructor for Walkee
  {
    float x = random(Window.widthPx); // Randomizes x within screen width
    float y = random(Window.heightPx); // Randomixes y within screen height
    position = new PVector(x, y); // Set initial position of the Walker
    velocity = new PVector(); // Starts the Walker with no movement
    acceleration = new PVector(); // No acceleration initially
    scale = random(5, 30); // Randomizes scale between 5 and 30
  }

  void update() // Updates the Walker's position and velocity
  {
    velocity.add(acceleration); // Applies acceleration to velocity
    velocity.limit(velocityLimit); // Limits the velocity to prevent excessive speed
    position.add(velocity); // Update position based on velocity
    acceleration.mult(0); // Reset acceleration each frame
  }

  void moveTowards(FollowCursor fc) // Moves the Walkers towards the cursor
  {
    PVector target = new PVector(fc.position.x, fc.position.y); // Setss the Cursor's current position
    PVector direction = PVector.sub(target, position); // Get the direction vector of Walker to cursor
    direction.normalize(); // Normalizes the direction
    direction.mult(0.2); // Scale the acceleration to adjust movement speed
    acceleration.set(direction); // Apply direction to Walker acceleration
  }

  void render() // Draws the Walker as a circle
  {
    fill(167); // Set color to light gray
    circle(position.x, position.y, scale); // Draw a circle based on the Walker's position
  }
}
