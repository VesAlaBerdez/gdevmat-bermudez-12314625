class Walker 
{
  float x, y; // Store the position of the walker
  
  Walker() 
  {
   x = width / 2; // Procs the Walker to spawn at the middle of screen (x)
   y = height / 2; // Procs the walker to spawn at the middle of screen (y)
  }
  
  void render() 
  {
     // Generate random colors (RGB values from 0 to 255)
    int r = int(random(256)); // Random red (0-255)
    int g = int(random(256)); // Random green (0-255)
    int b = int(random(256)); // Random blue (0-255)
    int a = int(random(50, 101)); // Random alpha (50-100)
    
    // Set the color and stroke
    fill(r, g, b, a);
    stroke(r, g, b, a);
    
    circle(x, y, 40); // Draws the circle at the walker's position
  }
  
  void randomWalk() 
  {
   int rng = int(random(8)); // Pick a random number from 0 to 7
   
   if (rng == 0) y += 10; // Down
   else if (rng == 1) y -= 10; // Up
   else if (rng == 2) x += 10; // Right
   else if (rng == 3) x -= 10; // Left
   else if (rng == 4) {x += 10; y += 10;} // Bottom-Right
   else if (rng == 5) {x -= 10; y += 10;} // Bottom-Left
   else if (rng == 6) {x += 10; y -= 10;} // Top-Right
   else if (rng == 7) {x -= 10; y -= 10;} // Top-Left
  }
  
  void randomWalkBiased() 
  {
   int rng = int(random(18)); // Pick a random number from 0 to 17
   
   if (rng < 4) x += 10; // 40% chance to move Right
   else if (rng >= 4 && rng < 6) y -= 10; // 20% chance to move Up
   else if (rng >= 6 && rng < 8) y += 10; // 20% chance to move Down
   else if (rng >= 8 && rng < 10) x -= 10; // 20% chance to move Left
   else if (rng >= 10 && rng < 12) { x += 10; y += 10; } // 20% Bottom-Right
   else if (rng >= 12 && rng < 14) { x -= 10; y += 10; } // 20% Bottom-Left
   else if (rng >= 14 && rng < 16) { x += 10; y -= 10; } // 20% Top-Right
   else if (rng >= 16 && rng < 18) { x -= 10; y -= 10; } // 20% Top-Left
  }
}
