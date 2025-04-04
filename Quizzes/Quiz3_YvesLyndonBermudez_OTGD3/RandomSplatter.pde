class RandomSplatter 
{
  void splatter() 
  {
  float gaussian = randomGaussian(); // Generates a Gaussian random number for x-coordinates
  float standardDeviationX = width / 4; // Declares how scattered the values will be
  float meanX = 2; // Sets the center position of the x-coordinates
  
  // Computes the x-position
  float x = standardDeviationX * gaussian + meanX; 
  
  // Generate a y-position using random() and maps it 
  float y = map(random(1), 0, 1, height, -200);
  
  float gaussianScale = randomGaussian(); // Generates a Gaussian random number for scaling
  float standardDeviationScale = 50; // Controls the sizes of the scale
  float meanScale = 20;  // Sets the average size of the circles
  
  // Compute the final scale size of the circles
  float scale = max(5, abs(standardDeviationScale * gaussianScale + meanScale));
  
  int r = int(random(256)); // Random red (0-255)
  int g = int(random(256)); // Random green (0-255)
  int b = int(random(256)); // Random blue (0-255)
  int a = int(random(10, 101)); // Random alpha (10-100)
   
  // Set the color and stroke
  fill (r, g, b, a);
  stroke(r, g, b, a);
  circle(x, y, scale);
  }
}
