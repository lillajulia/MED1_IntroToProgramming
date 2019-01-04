class ball {
  float BallX=250;// declared the variables i will be using later on 
  float BallY=250;
  float BallWidth=50;
  float movementX=random(5, 6);
  float movementY=random(5, 6);

  ball(float temp_BallX, float temp_BallY, float temp_BallWidth, float temp_movementX, float temp_movementY) {
    BallX=temp_BallX;
    BallY=temp_BallY;
    BallWidth=temp_BallWidth;
    movementX=temp_movementX;
    movementY=temp_movementY;
  }
  float getBallX() {
    return BallX;
  }
  float getBallY() {
    return BallY;
  }
  float getmovementX() {
    return movementX;
  }



  void display () {
    fill(#FFFFFF);
    ellipse(BallX, BallY, BallWidth, BallWidth);
  }
  void move () {
    BallX=BallX+movementX;//made the ball move
    BallY=BallY+movementY;
  }
  void checkcollision() {
    if (BallX<0) { // with the 3 if statements below, i restricted the ball to bounce within the boundaries of the screen
      movementX=-movementX;
    }
    if (BallY>height) {
      movementY=-movementY;
    }
    if (BallY<0) {
      movementY=-movementY;
    }
  }
  void switchdirection() {
    movementX=-movementX;
  }
}
