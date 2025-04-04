public class Walker {
  public PVector position; // Declares position vector
  public PVector velocity = new PVector(0, 0);  // Initialized velocity
  public PVector acceleration = new PVector(0, 0);  // Initialized acceleration
  
  public float velocityLimit = 10;  // Sets maximum velocity limit
  public float scale; // Declares scale for rendering the walker based on its mass
  public float mass; // Declares the mass of the walker
  public color c; // Declares color of the walker
  
  // Constructor to initialize the walker's properties
  public Walker(float mass, float posX, float posY) 
  {
    this.mass = mass; //Sets the mass of Walker
    this.position = new PVector(posX, posY); // Initialize position
    this.scale = mass * 15; // Scale size based on mass
    this.c = color(random(255), random(255), random(255)); // Randomizes color
  }
  
  // Apply Newton's Second Law of Motion
  public void applyForce(PVector force) 
  {
    PVector f = PVector.div(force, this.mass); // Divide the force by mass to get the acceleration
    this.acceleration.add(f); // Add the resulting acceleration to the Walker
  }
  
  // Update the walker's position and velocity
  public void update() 
  {
    this.velocity.add(this.acceleration); // Updates Velocity 
    this.velocity.limit(velocityLimit); // Ensure velocity does not exceed limit
    this.position.add(this.velocity);  // Updates Position
    this.acceleration.mult(0); // Resets Acceleration for every frame
  }
  
  // Draw the walker as a circle 
  public void render() 
  {
    noStroke();
    fill(c);
    circle(position.x, position.y, scale); 
  }
  
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
