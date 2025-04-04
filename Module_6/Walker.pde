class Walker {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  float scale;
  float r, g, b, a;
  
  Walker() {
    position = new PVector(0, 0);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = 1;
    scale = 10; // Default scale to avoid uninitialized errors
    r = g = b = a = 255; // Default white color with full opacity
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0); // Reset acceleration
  }
  
  void render() {
    fill(r, g, b, a);
    circle(position.x, position.y, scale);
  }
}
