//pingpongtable 2
Ball ball;
PVector[] vertices = new PVector[24];


void setup() {
  size(640, 320, P3D);
  // because the vertices are being set and half width and height
  float w = 2*width, h = 2*height, d = 2*1000;
//  noStroke();
//  lights();
//  smooth();
  ball = new Ball();
  
  // cube composed of 6 quads
    //front
    vertices[0] = new PVector(-w/2,-h/2,d/2);
    vertices[1] = new PVector(w/2,-h/2,d/2);
    vertices[2] = new PVector(w/2,h/2,d/2);
    vertices[3] = new PVector(-w/2,h/2,d/2);
    //left
    vertices[4] = new PVector(-w/2,-h/2,d/2);
    vertices[5] = new PVector(-w/2,-h/2,-d/2);
    vertices[6] = new PVector(-w/2,h/2,-d/2);
    vertices[7] = new PVector(-w/2,h/2,d/2);
    //right
    vertices[8] = new PVector(w/2,-h/2,d/2);
    vertices[9] = new PVector(w/2,-h/2,-d/2);
    vertices[10] = new PVector(w/2,h/2,-d/2);
    vertices[11] = new PVector(w/2,h/2,d/2);
    //back
    vertices[12] = new PVector(-w/2,-h/2,-d/2); 
    vertices[13] = new PVector(w/2,-h/2,-d/2);
    vertices[14] = new PVector(w/2,h/2,-d/2);
    vertices[15] = new PVector(-w/2,h/2,-d/2);
    //top
    vertices[16] = new PVector(-w/2,-h/2,d/2);
    vertices[17] = new PVector(-w/2,-h/2,-d/2);
    vertices[18] = new PVector(w/2,-h/2,-d/2);
    vertices[19] = new PVector(w/2,-h/2,d/2);
    //bottom
    vertices[20] = new PVector(-w/2,h/2,d/2);
    vertices[21] = new PVector(-w/2,h/2,-d/2);
    vertices[22] = new PVector(w/2,h/2,-d/2);
    vertices[23] = new PVector(w/2,h/2,d/2);
}

void draw() {
  
  background(0);
  lights();
  smooth();
  noFill();
  
  for (int i=0; i<6; i++){
    pushMatrix();
    stroke(color(255));
    translate(width/2, height/2, 0);
    beginShape(QUADS);
    for (int j=0; j<4; j++){
      vertex(vertices[j+4*i].x, vertices[j+4*i].y, vertices[j+4*i].z);
    }
    endShape();
    popMatrix();
  }
  
  ball.create();
  ball.move();
  

}

class Ball {
  float x = 0, y = 50, z = 0, r = 100;
  color col = color(255, 155, 100, 255);
  
  float speedX = 2, speedY = 3, speedZ = 5;
  
  Ball() {
    // default constructor
  }
  
  Ball(float x, float y, float z, color col, float r) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.col = col;
    this.r = r;
  }
  
  void create() {
    fill(col);
    noStroke();
    translate(x,y,-z);
    sphere(r);
  }
  
  void move() {
    
    if(screenX(x,y,z) > width*4) {
      speedX *= -1;
    }
    if(screenX(x,y,z) < 0) {
      speedX *= -1;
    }
    
    
    if(screenX(x,y,z) > height*4) {
      speedY *= -1;
    }
    if(screenX(x,y,z) < 0) {
      speedY *= -1;
    }
    
    
    if(z > 1000) {
      speedZ *= -1;
    }
    if(z < -100) {
      speedZ *= -1;
    }
    
    x += speedX;
    y += speedY;
    z += speedZ;
  }
}
