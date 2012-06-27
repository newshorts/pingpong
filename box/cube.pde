class Cube{
  PVector[] vertices = new PVector[24];
  float w, h, d;

  // Default constructor
  Cube(){ }

  // Constructor 2
  Cube(PVector bounds){
    this.w = bounds.x;
    this.h = bounds.y;
    this.d = bounds.z;

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
  void create(){
    // Draw cube
    for (int i=0; i<6; i++){
      // if its the bottom load the ping pong table
      if(i == 5) {
        if(t) {
          noStroke();  
        }
        beginShape(QUADS);
        if(t) {
          texture(pingpong);
        }
        for (int j=0; j<4; j++){
          vertex(vertices[j+4*i].x, vertices[j+4*i].y, vertices[j+4*i].z);
        }
        endShape();
      } else {
        beginShape(QUADS);
        for (int j=0; j<4; j++){
          vertex(vertices[j+4*i].x, vertices[j+4*i].y, vertices[j+4*i].z);
        }
        endShape();
      }
      
    }
  }
  void create(color[]quadBG){
    // Draw cube
    for (int i=0; i<6; i++){
      fill(quadBG[i]);
      beginShape(QUADS);
      for (int j=0; j<4; j++){
        vertex(vertices[j+4*i].x, vertices[j+4*i].y, vertices[j+4*i].z);
      }
      endShape();
    }
  }
}
