class Ball {
  PVector bounds;
  float x = 20, y = 20, z = -100, r = 100;
  color col = color(255);
  
  float speedX = 2, speedY = 2, speedZ = 10;
  
  float theta = 0.0, gravity = 2.0;
  
  float t = 0.0;
  
  // y = ma+b
  float b = bounds.y/2;
  float m = sin(x);
  float a = bounds.y/2;
  float d = 30;
  
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
    // update the current time
    t += 1;
    // the initial value of the animation
    float b = y;
    // total distance to change
    float c =  abs(0 - y);
    
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
    
    speedY += gravity;
//    speedY = (r/2) + (bounceHeight*(float)Math.abs(Math.sin(theta/bounceStride)));
    
    // right/left
    x = (sin(theta) * bounds.x/2) + speedX;
//    y = (cos(theta) * bounds.y/2) + speedY;
    
    if ((t /= d) < (1 / 2.75))
        y += c * (7.5625 * t * t) + b;

    else if (t < (2 / 2.75))
        y += c * (7.5625 * (t -= (1.5 / 2.75)) * t + 0.75) + b;

    else if (t < (2.5 / 2.75))
        y += c * (7.5625 * (t -= (2.25 / 2.75)) * t + 0.9375) + b;

    else
        y += c * (7.5625 * (t -= (2.625 / 2.75)) * t + 0.984375) + b;

//    y += speedY;
      
    // front/back
    z += speedZ;
  }
  
}
