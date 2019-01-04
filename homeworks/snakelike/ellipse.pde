class Circle {
  float ellipsex;
  float ellipsey;
  float ellipsewidth=10;
  Circle () {  
    ellipsex=mouseX;
    ellipsey=mouseY;
  }
  
  void draw() {
    fill(255,255,255);
    ellipse(ellipsex,ellipsey,ellipsewidth,ellipsewidth);
  }
} //created a class with an ellipse, that has a function to draw a circle and mouse position X and mouse position Y
