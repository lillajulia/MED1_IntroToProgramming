void setup () { //<>//
  //fullScreen();
  size(1000, 650);
  startGame();
}// made the canvas 
ball myball1;
float PaddleX=975;
float PaddleY=50;
float PaddleWidth=25;
float PaddleLength=300;
float PaddleYmovement=100;
int numberofgames=0;
//float Paddle2X=0;
//float Paddle2Y=50;
//float Paddle2Width=25;
//float Paddle2Length=100;
//float Paddle2Ymovement=50;

int score=0;
int [] scores= new int [5];

void startGame() {//defined how the game starts, so later on i can call this function to restart the game, when the ball leaves the 
  float BallX=250;
  float BallY=250;
  float BallWidth=50;
  float movementX=random(5, 6);
  float movementY=random(5, 6);
  myball1=new ball(BallX, BallY, BallWidth, movementX, movementY);

  PaddleX=975;
  PaddleY=50;
  PaddleWidth=25;
  PaddleLength=300;
  PaddleYmovement=100;
  score=0;
}

boolean collision;
boolean gameOver;
void draw() {
  collision=((myball1.getBallX()>PaddleX) && (myball1.getBallY()>=PaddleY) && (myball1.getBallY()<=PaddleY+PaddleLength) && (myball1.getmovementX()>0));//defined what collision with the paddle means, and specified that only when the ball moves right is when the collision should happen
  gameOver=(myball1.getBallX()>width);//defined when is the game over, and if game over is true, i call the start game function mentioned above
  if (gameOver==true) {
    scores[numberofgames]=score;
    numberofgames++;
    if (numberofgames<5) {
      startGame();
    } else { 
      displayscore ();
      noLoop();
    }
  } else { 

    for (int i = 0; i < 5; i++) {
      print(scores[i] + " ");
    }
    println();
    //println(numberofgames); 
    background(0, 0, 0);
    textSize(20);
    text( score, 10, 30); 
    fill(255, 255, 255);
    //ellipse(BallX, BallY, BallWidth, BallWidth);
    rect(PaddleX, PaddleY, PaddleWidth, PaddleLength);
    //rect(Paddle2X,Paddle2Y,Paddle2Width,Paddle2Length);

    if (collision) {//if collision happens, the movement should reverse, and the counter should add a point
      myball1.switchdirection();
      score++;
    }
    myball1.display() ;
    myball1.move();
    myball1.checkcollision();
  }
}
void keyPressed() {// gave the up and down arrows the function to move the paddle up and down
  if (key==CODED) {
    if (keyCode==UP) {
      PaddleY=PaddleY-PaddleYmovement;
    } else if (keyCode==DOWN) {
      PaddleY=PaddleY+PaddleYmovement;
    }

    // if (key==CODED){
    //    if (keyCode==SHIFT){
    //  Paddle2Y=Paddle2Y-Paddle2Ymovement;
    //}
    // else if (keyCode==CONTROL) {
    //   Paddle2Y=Paddle2Y+Paddle2Ymovement;
    //}
  }
}
void displayscore () {
  background(0, 0, 0);
  textSize(20);
  text( scores[0], 20, 30);
  text( scores[1], 20, 30);
  text( scores[2], 20, 30);
  text( scores[3], 20, 30);
  text( scores[4], 20, 30);
  fill(255, 255, 255);
}
