int count = 1;
Legs[] legs = new Legs[count];

void setup() {
  size(640, 360, P3D);
  noStroke();
  for (int i = 0; i < legs.length; i++) {
    legs[i] = new Legs(random(-10, 10), random(-50, 150), random(.5, 5), 
                       random(.5, 5), color(random(255), random(255), random(255)));
  }
}

void draw() {
  background(0);
  lights();
  translate(width/2, height/2);
  noStroke();
  fill(35);

  // Draw ground plane
  beginShape();
  vertex(-width*2, 0, -1000);
  vertex(width*2, 0, -1000);
  vertex(width/2, height/2, 400);
  vertex(-width/2, height/2, 400);
  endShape(CLOSE);

  // Update and draw the legs
  for (int i = 0; i < legs.length; i++) {
    legs[i].create();
    // Set foot step rate
    legs[i].step(random(10, 500));
    // Move legs along x, y, z axes
    // z-movement dependent upon step rate
    legs[i].move();
  }
}





/**
 * Legs class
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */
 
class Legs {
  // Instance properties with default values
  float x = 0, y = 0, z = 0, w = 150, ht = 125;
  color col = #77AA22;
  // Advanced properties
  float detailW = w/6.0;
  float detailHt = ht/8.0;
  float shoeBulge = detailHt*2.0;
  float legGap = w/7.0;

  // Dynamics properties
  float velocity = .02, stepL, stepR, stepRate = .50; 
  float speedX = 1.0, speedZ, spring, damping = .001, theta;

  // Default constructor
  Legs() {
  }

  // Standard constructor
  Legs(float x, float z, float w, float ht, color col) {
    this.x = x;
    this.z = z;
    this.w = w;
    this.ht = ht;
    this.col = col;
    fill(col);
    detailW = w/6.0;
    detailHt = ht/8.0;
    shoeBulge = detailHt*2.0;
    legGap = w/7.0;
    speedX = random(-speedX, speedX);
  }

  // Advanced constructor
  Legs(float x, float z, float w, float ht, color col, float detailW, 
        float detailHt, float shoeBulge, float legGap) {
    this.x = x;
    this.z = z;
    this.w = w;
    this.ht = ht;
    this.col = col;
    this.detailW = detailW;
    this.detailHt = detailHt;
    this.shoeBulge = shoeBulge;
    this.legGap = legGap;
    speedX = random(-speedX, speedX);
  }

  // Draw legs
  void create() {
//    stroke(0);
    fill(col);
    pushMatrix();
    translate(x, y, -z);
    sphere(shoeBulge * 100);
    popMatrix();
    
  }

  // Set advanced property values
  void setDetails(float detailW, float detailHt, float shoeBulge, float legGap) {
    this.detailW = detailW;
    this.detailHt = detailHt;
    this.shoeBulge = shoeBulge;
    this.legGap = legGap;
  }

  // Make the legs step
  void step(float stepRate) {
    this.stepRate = stepRate;
    spring = ht/2.0;
    stepL = sin(theta)*spring;
    stepR = cos(theta)*spring;
    theta += radians(stepRate);
  }
  
  // Alternative overloaded step method
  void step() {
    spring = ht/2.0;
    stepL = sin(theta)*spring;
    stepR = cos(theta)*spring;
    theta += radians(stepRate);
  }


  // Moves legs along x, y, z axes
  void move() {
    // Move legs along y-axis
    y = stepR*damping;

    // Move legs along x-axis and
    // check for collision against frame edge
    x += speedX;
    if (screenX(x, y, z) > width) {
      speedX *= -1;
    }
    if (screenX(x, y, z) < 0) {
      speedX *= -1;
    }

    // Move legs along z-axis based on speed of stepping 
    // and check for collision against extremes
    speedZ = (stepRate*velocity);
    z += speedZ;
    if (z > 1000) {
      z = 1000;
      velocity *= -1;
    }
    if (z < -100) {
      z = -100;
      velocity *= -1;
    }
  }
  
  void setDynamics(float speedX, float spring, float damping) {
    this.speedX = speedX;
    this.spring = spring;
    this.damping = damping;
  }
}

