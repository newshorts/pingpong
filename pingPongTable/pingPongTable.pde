// pingpong table
int count = 1;
Balls[] balls = new Balls[count];

void setup() {
  size(640, 360, P3D);
  noStroke();
  
  for(int i = 0; i < balls.length; i++) {
    balls[i] = new Balls(200, 200, 100, color (155, 155, 0, 225));
  }
}

void draw() {
  background(0);
  lights();
  translate(width/2, height/2);
  noStroke();
  fill(155,0,0,225);
  
  // draw ground plane
  beginShape();
  vertex(-width*2,0,-1000);
  vertex(width*2,0,-1000);
  vertex(width/2, height/2, 400);
  vertex(-width/2,height/2, 400);
  endShape(CLOSE);
  
  for(int i = 0; i < balls.length; i++) {
    balls[i].create();
//    balls[i].step(random(10, 50));
    balls[i].move();
  }
}

/**
 * Balls class
 * By Mike Newell 
 * Ping Pong Google hangout experiment
 */
 
class Balls {
  float x = 0, y = 0, z = 0, r = 150;
  color col = #77aa22;
  float velocity = .02, stepRate = .5;
  float speedX = 1.0, speedZ, spring, damping = .001, theta;
  
  Balls() {
    //default constructor
    this(100,100,100,color(255));
  }
  
  // Standar Constructor
  Balls(float x, float z, float r, color col) {
    this.x = x;
    this.z = z;
    this.r = r;
    this.col = col;
    fill(col);
    this.speedX = random(-50, 50);
    this.speedZ = random(-1, 1);
  }
  
  void create() {
    fill(col);
    pushMatrix();
    translate(x, y, -z);
    sphere(r);
    popMatrix();
  }
  
  void move() {
    y = 50;
    x += speedX;
    if(screenX(x,y,z) > width) {
      speedX *= -1;
    }
    if(screenX(x,y,z) < 0) {
      speedX *= -1;
    }
    
    speedZ = 1;
    z += speedZ;
    if(z > 1000) {
      z = 1000;
      velocity *= -1;
    }
    if(z < -100) {
      z = -100;
      velocity *= -1;
    }
    
  }
}
