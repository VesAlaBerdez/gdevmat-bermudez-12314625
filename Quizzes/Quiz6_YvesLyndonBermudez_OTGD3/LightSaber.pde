class LightSaber
{
  // Checks the mouse position relative to the center of the screen
  PVector mousePos()
  {
    float x = mouseX - Window.windowWidth / 2;
    float y = -(mouseY - Window.windowHeight / 2);
    return new PVector(x, y);
  }
  
  void renderLine1()  // Red Outer Glow (Mouse Pointer Side)
  {
    // Sets the Color and Thickness of Line
    strokeWeight(20);
    stroke(255, 0, 0);
    
    PVector mouse = mousePos(); // Get the mouse direction
    
    mouse.normalize(); // Normalize to correct the direction
  
    PVector startPos = PVector.add(PVector.mult(mouse, 80), new PVector(0, 0)); // Offset the origin by 80
    PVector endPos = PVector.add(PVector.mult(mouse, 350), new PVector(0, 0)); // Sets the Full Light Saber Length
    
    line(startPos.x, startPos.y, endPos.x, endPos.y); // Draw line from the end of Black Handle to Light Saber Tip
    
    println(mouse.mag()); // Prints the magnitude of one side of the Light Saber
  }
  
  void renderLine2() // White Inner Glow (Mouse Pointer Side)
  {
    // Sets the Color and Thickness of Line
    strokeWeight(10);
    stroke(255, 255, 255);
    
    PVector mouse = mousePos(); // Get the mouse direction
    
    mouse.normalize(); // Normalize to correct the direction
    PVector startPos = PVector.mult(mouse, 80);  // Start After the Black Handle
    PVector endPos = PVector.mult(mouse, 347); // Full saber length
    
    line(startPos.x, startPos.y, endPos.x, endPos.y); // Draw line from the end of Black Handle to Light Saber Tip
  }
  
  void renderLine3() // Black Handle (Mouse Pointer Side)
  {
    // Sets the Color and Thickness of Line
    strokeWeight(15);
    stroke(0, 0, 0);
    
    PVector mouse = mousePos(); // Get the mouse direction
    
    mouse.normalize().mult(80); // Normalize to correct the direction
    line(0, 0, mouse.x, mouse.y); // Draws the line of Black Handle
  }
  
  void renderLine4() // Red Outer Glow (Opposite Side)
  {
    // Sets the Color and Thickness of Line
    strokeWeight(20);
    stroke(255, 0, 0);
    
    PVector mouse = mousePos(); // Get the mouse direction
    
    mouse.normalize(); // Normalize first to correct the direction
    
    PVector startPos = PVector.add(PVector.mult(mouse, -80), new PVector(0, 0)); // Offset the origin by -80
    PVector endPos = PVector.add(PVector.mult(mouse, -350), new PVector(0, 0)); // Sets the Full Light Saber Length
    
    line(startPos.x, startPos.y, endPos.x, endPos.y); // Draw line from the end of Black Handle to Light Saber Tip
  }
  
  void renderLine5() // White Inner Glow (Opposite Side)
  {
    // Sets the Color and Thickness of Line
    strokeWeight(10);
    stroke(255, 255, 255);
    
    PVector mouse = mousePos(); // Get the mouse direction
    
    mouse.normalize(); // Normalize to correct the direction
    
    PVector startPos = PVector.mult(mouse, -80); // Start After the Black Handle
    PVector endPos = PVector.mult(mouse, -347); // Full Light Saber length
    
    line(startPos.x, startPos.y, endPos.x, endPos.y); // Draw line from the end of Black Handle to Light Saber Tip
  }
  
  void renderLine6() // Black Handle (Opposite Side)
  {
    // Sets the Color and Thickness of Line
    strokeWeight(15);
    stroke(0, 0, 0);
    
    PVector mouse = mousePos(); // Get the mouse direction
    
    mouse.normalize().mult(-80); // Normalize to correct the direction
    line(0, 0, mouse.x, mouse.y); // Draws the line of Black Handle
  }
}
