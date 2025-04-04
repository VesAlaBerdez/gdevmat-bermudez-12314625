void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
} 

PVector mousePos()
{
 float x = mouseX - Window.windowWidth / 2;
 float y = -(mouseY - Window.windowHeight / 2);
 return new PVector(x, y);
}

void draw()
{
  background(130);
  
  strokeWeight(5);
  stroke(255, 0, 0);
  
  PVector mouse = mousePos();
  
  //mouse.mult(0.5);
  mouse.normalize().mult(500);
  line(0, 0, mouse.x, mouse.y);
  
  println(mouse.mag());
}
