// Declare LightSaber as an global object
LightSaber lightSaber;

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  lightSaber = new LightSaber(); // Initialize the LightSaber object
} 

void draw()
{
  background(130); // Set background color (gray)
  
  // Render different parts of the lightsaber
  lightSaber.renderLine1(); // Red Outer Glow (Mouse Pointer Side)
  lightSaber.renderLine4(); // Red Outer Glow (Opposite Side)
  
  lightSaber.renderLine2(); // White Inner Glow (Mouse Pointer Side)
  lightSaber.renderLine5(); // White Inner Glow (Opposite Side)
  
  lightSaber.renderLine3(); // Black Handle (Mouse Pointer Side)
  lightSaber.renderLine6(); // Black Handle (Opposite Side)
}
