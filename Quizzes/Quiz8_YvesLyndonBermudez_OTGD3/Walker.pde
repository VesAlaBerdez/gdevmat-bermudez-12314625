public class Walker
{
  public PVector position = new PVector(-500, 200); // Sets the position of Walker
  public PVector velocity = new PVector(); // Declares the Velocity in Walker
  public PVector acceleration = new PVector(); // Declares Acceleration in Walker
  public float velocityLimit = 10; // Sets the maximum speed limit to prevent uncontrolled movement
  public float scale; // Declares scale of Walker
  public float mass; // Declares mass of the Walker
  color c; // Color of the Walker
  
  // Constructor for Walker
  public Walker(float mass)
  {
    this.mass = mass; // Assign the mass of the Walker
    this.scale = this.mass * 15; // Assigns the Scale to mass times 15
    this.c = color(random(255), random(255), random(255)); // Assigns random color to Walkers
  }
  
  // Apply Newton's Second Law: F = ma
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass); // Divide the force by mass to get the acceleration
    this.acceleration.add(f); // Add the resulting acceleration to the Walker
  }
  
  // Update Walker's movements
  public void update()
  {
    this.velocity.add(this.acceleration); // Add acceleration to the velocity
    this.velocity.limit(velocityLimit); // Limit the velocity
    this.position.add(this.velocity); // Update position based on velocity
    this.acceleration.mult(0); // Resets the acceleration 
  }
  
  // Render the Walker as a circle on screen
  public void render()
  {
    fill(c); // Set fill color
    circle(this.position.x, this.position.y, scale); // Draw circle
  }
  
  // Checks if Walker hits the screen edges and make it bounce
  public void checkEdges()
  {
    // Checks horizontal boundaries
    if (this.position.x > Window.right) 
    {
      this.position.x = Window.right; // Stop at right boundary
      this.velocity.x *= -1; // Reverse X velocity to make the Walker bounce
    }
    else if (this.position.x < Window.left)
    {
      this.position.x = Window.left; // Stop at left boundary
      this.velocity.x *= -1; // Reverse X velocity to make the Walker bounce
    }
    
    // Checks vertical boundaries
    if (this.position.y > Window.top) 
    {
      this.position.y = Window.top; // Stop at top boundary
      this.velocity.y *= -1; // Reverse Y velocity to make the Walker bounce
    }
    else if (this.position.y < Window.bottom)
    {
      this.position.y = Window.bottom; // Stop at bottom boundary
      this.velocity.y *= -1; // Reverse Y velocity to make the Walker bounce
    }
  }
}
