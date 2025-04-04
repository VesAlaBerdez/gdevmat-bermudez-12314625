void setup() 
{
 size(1280, 720, P3D);
 camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
 background(255); 
}

// Creates an instance of the PerlinNoise class to handle the movement and rendering
PerlinNoise perlinWalker = new PerlinNoise();

void draw() 
{
  perlinWalker.render(); // Render the walker
  perlinWalker.perlinWalk(); // Updates the walker's position using Perlin noise
}
