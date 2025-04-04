// Global variables
int xSpacing = 1; // Sets the spacing between points in the sine wave
int w; // Declare width of the window
float theta = 0.0; // Sets the angle of the wave oscillation
float amplitude = 25.0; // Sets the Amplitude or the height of the sine wave
float period = 60.0; // Sets the distance between waves
float xFrequency; // Declares the change in x per step in the sine wave
float[] yValues; // Stores the array for the y-values for the sine wave

// Global colors
color white = color(255, 255, 255);
color yellow = color(255, 255, 0);
color purple = color(255, 0, 255);
color blue = color(0, 0, 255);

void setup()
{
  size(1280, 720, P3D); // Sets the window size and enable 3D rendering
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0); // Adjusts the camera perspective
  w = width + xSpacing; // Set width with padding
  xFrequency = (TWO_PI / period) * xSpacing; // Determines how fast the wave oscillates.
  yValues = new float[w / xSpacing]; // Initialize array of yValues
} 

void draw()
{
  background(0); // Set the color of the background to black
  
  // Executes all commands
  drawCartesianPlane();
  drawQuadraticFunction();
  drawLinearFunction();
  calcWave();
  renderWave();
}

void drawCartesianPlane() 
{
  strokeWeight(1); 
  fill(white); 
  stroke(white); 
  line(-500, 0, 500, 0); 
  line(0, -500, 0, 500); 
 
  // Draws the Cartesian Plane
  for (int i = -500; i <= 500; i += 10)
  {
    line(i, -2, i, 2);
    line(-2, i, 2, i);
  } 
}
  
void drawQuadraticFunction()
{
  fill(yellow); 
  stroke(yellow); 
  
  // Plot the quadratic function: f(x) = x^2 - 15x - 3
  for (float x = -300; x <= 300; x += 0.1f)
  {
    float y = ((float)Math.pow(x, 2) - (15 * x) - 3);
    circle(x, -y, 2); // Invert the y-axis due to Processing using an inverted y-axis 
  }
}
  
void drawLinearFunction()
{
  fill(purple);
  stroke(purple);
  
  // Plot the linear function: f(x) = -5x + 30
  for (float x = -300; x <= 300; x+= 0.5)
  {
    float y = ((-5 * x) + 30);
    circle(x, -y, 2); // Invert the y-axis due to Processing using an inverted y-axis 
  }
}
  
void calcWave()
{
  theta += 0.9; // Animates the entire wave movement to move slower or faster
  
  float x = theta;
  for (int i = 0; i < yValues.length; i++) 
  {
    yValues[i] = sin(x) * amplitude; // Computes the value for the sine wave
    x += xFrequency; // Used to move to the next x value
  }
}
  
void renderWave()
{
  fill(blue); 
  noStroke(); 
  
  // Draws the sine wave
  for (int i = 0; i < yValues.length; i++) 
  {
    float x = (i * xSpacing) - (width / 2); // Adjusts the x position
    float y = (-yValues[i]); // Invert the y-axis due to Processing using an inverted y-axis
    ellipse(x, y, 2, 2); // Draws the sine wave
  }
}

/* Note: For correct mathematical behavior, the y-axis are inverted because the  
Processing's y-axis is flipped and will appear upside-down.*/
