class Instructions {
      
  Instructions() {
    // default constructor
  }
  
  void loadInstructions() {
    //font = loadFont("FFScala-Bold-12.vlw"); 
    
    String sa = "Press 'a' to angle the view.";
    text(sa, 15, 20);
    
    String sb = "Press 'b' to turn borders on and off.";
    text(sb, 15, 40);
    
    String sc = "Press 'c' to curve the ball.";
    text(sc, 15, 60);
    
    String sg = "Press 'g' to turn gravity on and off.";
    text(sg, 15, 80);
    
    String sz = "Press 'z' to toggle these instructions.";
    text(sz, 15, 100);
  }
}


