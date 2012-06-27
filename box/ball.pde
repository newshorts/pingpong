class Ball {
  PVector bounds, velocity;  
  float x = 20, y = 20, z = -100, r = 100;
  color col = color(255);
  
  float theta = 0.0, gravity = 0.9, damping = 1;
  
  Ball(PVector bounds) {
    this.bounds = bounds;
    velocity = new PVector(10,0,25);
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
    step();
    fill(col);
    noStroke();
    translate(x, y, -z);
    sphere(r);
  }
  
  void step() {
    wallCollisions();
    
    velocity.y += gravity;
    
    println("velocity Y: " + velocity.y + " y: " + y + " bounds: " + bounds.y/2);
    
    if(y > bounds.y/2) {
      velocity.y *= -0.95;
      y = bounds.y/2;
    }
    
    x += velocity.x;
    y += velocity.y;
    z += velocity.z;
  }
    
  void wallCollisions() {
    
    // x
    if(x > (bounds.x/2)) {
      velocity.x *= -1;
//      velocity.x *= damping;
    }
    
    if(x < -(bounds.x/2)) {
      velocity.x *= -1;
//      velocity.x *= damping;
    }
    
    // y
//    if(y > (bounds.y/2)) {
//      velocity.y *= -1;
//      velocity.y *= damping;
//    }
//    
//    if(y < -(bounds.y/2)) {
//      velocity.y *= -1;
//      velocity.y *= damping;
//    }
    
    // z
    if(z > (bounds.z/2)) {
      velocity.z *= -1;
//      velocity.z *= damping;
    }
    
    if(z < -(bounds.z/2)) {
      velocity.z *= -1;
//      velocity.z *= damping;
    }
    
  }  
}
