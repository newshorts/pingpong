PVector[] vertices = new PVector[24];
Cube stage;
Ball ball;

void setup() {
  size(640, 320, P3D);
  float w = width*2, h = height*2, d = 2000;
  
  stage = new Cube(new PVector(w,h,d));
  
  ball = new Ball(new PVector(w,h,d));
}

void draw() {
  
  // Center in display window
  
  translate(width/2, height/2, -1400);
//  rotateX(radians(60));
  
  background(0);
  lights();
  noFill();
  stroke(255);
  smooth();
  
//  pushMatrix();
  stage.create();
//  popMatrix();
  ball.step();
  ball.create();
    
}
