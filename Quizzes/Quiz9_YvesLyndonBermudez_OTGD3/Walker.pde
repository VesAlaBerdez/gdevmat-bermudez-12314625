public class Walker
{
  public PVector position; // Declares position of the walker
  public PVector velocity = new PVector(); // Declares Velocity vectors
  public PVector acceleration = new PVector(); // Declares acceleration vectors

  public float velocityLimit = 10; // Sets max speed limit 
  public float scale; // Declares scale of the walker
  public float mass; // Declares mass of the walker
  color c; // Declares color of the walker
  
  // Constructor for mass and vertical position
  public Walker(float mass, float posY)
  {
    this.mass = mass; // Assign a given mass
    this.scale = this.mass * 9; // Scale the walker to the proportional to mass
    this.c = color(random(255), random(255), random(255)); // Randomizes color

    float offsetX = -Window.windowWidth + 100; // Shift 100 px right from left edge
    
    this.position = new PVector(offsetX, posY); // Starts at left side of the screen and assigns vertical position
  }
  
  // Apply a force to this walker using: a = F / m
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass); // Scales the force based on mass to get acceleration
    this.acceleration.add(f); // Adds a resulting acceleration
  }
  
  // Updates movement of the walker
  public void update()
  {
    this.velocity.add(this.acceleration); // Velocity increases based on acceleration
    this.velocity.limit(velocityLimit); // Limits the speed
    this.position.add(this.velocity); // Updates position based on velocity
    this.acceleration.mult(0); // Reset acceleration
  }
  
  // Draw the walker on screen
  public void render()
  {
    noStroke();
    fill(c); 
    circle(this.position.x, this.position.y, scale); 
  }
  
  // Check screen edges and bounce back if walker hits them
  public void checkEdges()
  {
    // Checks right side screen boundary
    if (this.position.x > Window.right) 
    {
      this.position.x = Window.right; 
      this.velocity.x *= -1; // Bounce back
    }
  }
}
