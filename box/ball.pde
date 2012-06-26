class Ball {
  PVector bounds;
  float x = 20, y = 20, z = -100, r = 100;
  color col = color(255);
  
  float speedX = 2, speedY = 2, speedZ = 10;
  
  float theta = 0.0, gravity = 2;
  
  // y = ma+b
//  b = bounds.y/2;
//  m = sin(x);
//  a = bounds.y/2;
  
  Ball(PVector bounds) {
    this.bounds = bounds;
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
    if (x > bounds.x/2 || x < -bounds.x/2){
      speedX *= -1;
      println("hit the boundary x: " + x);
    }
    if (y > bounds.y/2 || y < -bounds.y/2){
      speedY *= -1;
//      speedY = 2;
      println("hit the boundary y: " + y);
    }
    if (z > bounds.z/2 || z < -bounds.z/2){
      speedZ *= -1;
      println("hit the boundary z: " + z);
    }
    
    theta += 0.02;
    println("value of theta: " + theta);
    
    speedY += gravity;
    
    // to curve the ball
    x = (sin(theta) * bounds.x/2) + speedX;
//    y = (cos(theta) * bounds.y/2) + speedY;
    y += speedY;
    z += speedZ;
  }
  
}
