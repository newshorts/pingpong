class Ball {
  PVector bounds, velocity;  
  float x = 20, y = 20, z = -100, r = 100;
  color col = color(255);
  
  float theta = 0.0, gravity = 0.9, damping = 1;
  
  Ball(PVector bounds) {
    this.bounds = bounds;
    velocity = new PVector(10,15,15);
  }
  
  Ball(PVector bounds, float x, float y, float z, color col, float r) {
    this.bounds = bounds;
    this.x = x;
    this.y = y;
    this.z = z;
    this.col = col;
    this.r = r;
  }
  
  void create () {
    fill(col);
    noStroke();
    translate(x, y, -z);
    sphere(r);
  }
  
  void step() {
    wallCollisions();
    
    x += velocity.x;
    y += velocity.y;
    z += velocity.z;
  }
  
  void wallCollisions() {
    
    // x
    if(x > (bounds.x - r)) {
      x = bounds.x - r;
      velocity.x *= -1;
      velocity.x *= damping;
    }
    
    if(x < r) {
      x = r;
      velocity.x *= -1;
      velocity.x *= damping;
    }
    
    // y
    if(y > (bounds.y - r)) {
      y = bounds.y - r;
      velocity.y *= -1;
      velocity.y *= damping;
    }
    
    if(y < r) {
      y = r;
      velocity.y *= -1;
      velocity.y *= damping;
    }
    
    // z
    if(z > (bounds.z - r)) {
      z = bounds.z - r;
      velocity.z *= -1;
      velocity.z *= damping;
    }
    
    if(z < r) {
      z = r;
      velocity.z *= -1;
      velocity.z *= damping;
    }
    
  }  
}
