public class Walker
{
  public PVector position = new PVector(); // Declares the position of the walker
  public PVector velocity = new PVector(); // Declares the velocity of the walker
  public PVector acceleration = new PVector(); // Declares the acceleration of the walker
  
  public float velocityLimit = 10; // Limits how fast the walker can move
  public float scale = 30;  // Set scale for the size of the walker
  public float mass = 1; // Sets the mass of the walker
  public float gravitationalConstant = 1.5; // Set gravitational constant used for attraction strength
  
  public color c; // Declares color of the walker
  
  // Constructor to initialize the Walker
  public Walker(float mass, float posX, float posY)
  {
    this.mass = mass; // Sets the mass of Walker to random
    this.position = new PVector(posX, posY); // Initializes position of the Walker
    this.scale = mass * 20; // Scale the size to random but still based on mass
    this.c = color(random(255), random(255), random(255), random(100, 255)); // Randomizes thw color
  }
  
  // Apply Newton's Second Law of Motion: F = m * a
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass); // Apply force divided by mass to get acceleration
    this.acceleration.add(f); // Force Accumulation
  }
  
  // Updates the Walker's velicty, postion, and acceleration
  public void update()
  {
    this.velocity.add(this.acceleration); // Adds acceleration to the velocity
    this.velocity.limit(velocityLimit); // Limit the maximum velocity
    this.position.add(this.velocity); // Update the walker position based on velocity
    this.acceleration.mult(0); // Resets Acceleration every frame
    
    // Constrain the walker's position to stay within the screen bounds
    this.position.x = constrain(this.position.x, Window.left + scale/2, Window.right - scale/2);
    this.position.y = constrain(this.position.y, Window.bottom + scale/2, Window.top - scale/2);
  }
  
  // Draws the Walker in the screen
  public void render()
  {
    noStroke();
    fill(c);
    circle(position.x, position.y, scale); 
  }
  
  // Calculate the gravitational attraction between two walkers
  public PVector calculateAttraction(Walker walker)
  {
    PVector force = PVector.sub(walker.position, this.position); // Finds the direction of attraction
    float distance = force.mag(); // Find the distance between the two walkers
    force.normalize(); // Normalize to keep the direction

    // Prevent very small distance issues and avoids divide by 0
    distance = constrain(distance, 5, 25); 

    // Calculate the gravitational force strength based on Newtons law: F = G * (m1 * m2) / r^2
    float strength = (this.gravitationalConstant * this.mass * walker.mass) / (distance * distance);
    force.mult(strength); // Multiply direction by strength to get the force vector
    return force; // Return the calculated Force
  }
}
