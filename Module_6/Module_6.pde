PVector wind = new PVector(0.4, 0);
//PVector gravity = new PVector(0, -0.4);

Walker[] walkers = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < 10; i++) // Fixed "int" to "int"
  {
    float posX = 1.25 * (Window.windowWidth / 10) * (i - 5);
    walkers[i] = new Walker();
    walkers[i].position = new PVector(posX, 200);
    walkers[i].mass = 10 - i;  // Fixed incorrect subtraction (10 -1)
    walkers[i].scale = walkers[i].mass * 15;
    walkers[i].r = random(1, 255);
    walkers[i].g = random(1, 255);
    walkers[i].b = random(1, 255);
    walkers[i].a = random(150, 255);
  } 
}

void draw()
{
  background(255);
  noStroke();
  for (Walker w : walkers)
  {
     // Friction = -1 * mew * N * v
   float mew = 0.1f; // Coefficient of Friction
   float normal = 1;
   float frictionMagnitude = mew * normal;
   PVector friction = w.velocity.copy(); // Copies the current velocity of the walker
   friction.mult(-1);
   friction.normalize();
   friction.mult(frictionMagnitude);
   w.applyForce(friction);
    
    PVector gravity = new PVector(0, -0.15 * w.mass);
    w.applyForce(gravity);
    //w.applyForce(wind);
    w.update();
    w.render();

    if (w.position.x >= Window.right) // Fixed "Windiw" to "Window"
    {
      w.position.x = Window.right;
      w.velocity.x *= -1;
    }

    if (w.position.y <= Window.bottom)
    {
      w.position.y = Window.bottom;
      w.velocity.y *= -1;
    }
  }
}
