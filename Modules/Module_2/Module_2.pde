void setup() 
{
 size(1020, 720, P3D);
 camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

 Walker myWalker = new Walker(); // Creates an instance of our walker class here in sketch
 /*Walker xWalker = new Walker();*/

void draw() 
{
  background(0); 
  
  /*int rng = int(random(5)); // Generates random value from 0 to 5
  println(rng);*/
  myWalker.randomWalk();
  myWalker.render();
  /*xWalker.x = 100;
  xWalker.render();*/
}
