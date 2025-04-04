Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker myWalker = new Walker();

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  myWalker.position = new PVector(0, 300);
  myWalker.g = 0;
  myWalker.b = 0;
  myWalker.mass = 5;
  myWalker.scale = myWalker.mass * 10;
} 

void draw()
{
 background(255); 
 
 ocean.render();
 myWalker.render();
 myWalker.update();
 
 PVector gravity = new PVector(0, -0.25 * myWalker.mass);
 myWalker.applyForce(gravity); // Applying gravity to our Walker
 
 float c = 0.1f;
 float normal = 1;
 float frictionMagnitude = c * normal;
 PVector friction = myWalker.velocity.copy();
 // F = -uNv
 myWalker.applyForce(friction.mult(-1).normalize().mult(frictionMagnitude)); // Applying Friction to Walker
 
 if (myWalker.position.y <= Window.bottom)
 {
  myWalker.position.y = Window.bottom;
  myWalker.velocity.y *= -1;
 }
 
 if (ocean.isCollidingWith(myWalker))
 {
   PVector dragForce = ocean.calculateDragForce(myWalker);
   myWalker.applyForce(dragForce);
 }
}
