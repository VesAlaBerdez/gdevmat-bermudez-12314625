public class PerlinNoise
{
  // Declare the positions variables
  public float x;
  public float y;
  
  public float tx = 0, ty = 10000; // Declare the Perlin noise time variables for movement
  public float tt = 20000; // Declare the thickness of noise time
  public float tr = 30000, tg = 40000, tb = 50000; // Declare the RGB noise time
  
  // Constructor to initialize x and y at a Perlin-based position
  public PerlinNoise() 
  {
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);
  }
  
  void render()
  {
   // The Perlin Noise color mapping
   int r = int(random(256)); // Random red (0-255)
   int g = int(random(256)); // Random green (0-255)
   int b = int(random(256)); // Random blue (0-255)
   int a = int(random(10, 101)); // Random alpha (10-100)
   
   // Sets the Perlin-based thickness through mapping
   float t = map(noise(ty), 0, 1, 5, 150);
   
   fill(r, g, b, a); // Fill color with perlin-generated RGB
   noStroke(); // Removes outline
   circle(x, y, t);  // Draws the circle at position x and y with radius t
    
    tt += 0.01f; // Changes the thickness over time
    tr += 0.01f; // Changes the red value over time
    tg += 0.01f; // Changes the green value over time
    tb += 0.01f; // Changes the blue value over time
  }
 
 void perlinWalk() 
 {
   // Generates smooth Perlin-based movement yhorugh x and y position
   x = map(noise(tx), 0, 1, -640, 640);
   y = map(noise(ty), 0, 1, -360, 360);
  
   // Increments Perlin noise time variables to change position over time
   tx += 0.01f;
   ty += 0.01f;
 }
}
