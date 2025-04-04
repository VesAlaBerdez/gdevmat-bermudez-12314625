public class Liquid
{
  // Declares position, size, and drag coefficient of the liquid
  public float x, y;
  public float horizon, depth;
  public float cd;
  
  // Constructor to initialize the liquid's properties
  public Liquid(float x, float y, float horizon, float depth, float cd)
  {
    this.x = x;
    this.y = y;
    this.horizon = horizon;
    this.depth = depth;
    this.cd = cd;
  }
  
  // Renders the liquid on the screen
  public void render()
  {
    noStroke();
    fill(28, 120, 186); // Sets the color as Light Blue
    
     // Draw the four corners of the ocean's shape
    beginShape();
    vertex(x - horizon, y, 0);
    vertex(x + horizon, y, 0);
    vertex(x + horizon, y + depth, 0);
    vertex(x - horizon, y + depth, 0);
    endShape();
  }
  
  // Checks if a given Walker is in contact or colliding with the liquid
  public boolean isCollidingWith(Walker walker)
  {
    PVector pos = walker.position;
    return pos.x > this.x - this.horizon && // Check if walker is horizontally within the liquid
           pos.x < this.x + this.horizon && // Check if walker is horizontally within the liquid
           pos.y < this.y; // Checks if walker is below the liquid's horizon
  }
  
  // Calculates the drag force exerted on the walker by the liquid
  public PVector calculateDragForce(Walker walker)
  {
    // Declares Drag Magnitude which is coefficient of drag * speed squared
    float speed = walker.velocity.mag();
    float dragMagnitude = this.cd * speed * speed;
    
    PVector dragForce = walker.velocity.copy().mult(-1); // Direction is inverse of velocity
    dragForce.normalize(); // Normalize the direction
    dragForce.mult(dragMagnitude); // Scale by drag magnitude
    return dragForce;
  }
}
