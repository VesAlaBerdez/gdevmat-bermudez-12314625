class Matter 
{
  PVector position; // Decalres the position of the Matter
  float scale; // Declare size of the Matter objects
  color c; // Random color of the Matter object
  
  // Constructor to initialize the Matter using the Gaussian distribution
  Matter() 
  {
    float x = randomGaussian() * (Window.widthPx / 4) + (Window.widthPx / 2);
    float y = randomGaussian() * (Window.heightPx / 4) + (Window.heightPx / 2);
    position = new PVector(x, y);
    scale = random(5, 30); // Random size between 5 and 30
    c = color(random(255), random(255), random(255)); // Random color
  }
  
  // Method to move the Matter towards the Black Hole
  void moveTowards(BlackHole bh) 
  {
    // Generate Perlin noise-based movement factors
    float noiseX = noise(position.x * 0.01f);
    float noiseY = noise(position.y * 0.01f);
    
    PVector direction = PVector.sub(bh.position, position); // Calculates the direction of vector
    direction.normalize(); // Normalizes the vector
    direction.x *= (5 + noiseX * 3); // Apply Perlin Noise to the X-axis speed
    direction.y *= (5 + noiseY * 3); // Apply Perlin Noise to the Y-axis speed
    position.add(direction); // Apply the movement
  }
  
  // Render method to draw the Matter object
  void render() 
  {
    noStroke(); 
    fill(c);
    circle(position.x, position.y, scale);
  }
}
