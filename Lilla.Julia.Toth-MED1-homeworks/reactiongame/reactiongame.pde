
int state=0; // state 0-selection screen state1-mouseaccuracy state2-reactiontime state3-scorescreen 
int textx1=75;
int texty1=175;
int textx2=250;
int texty2=175;
int textSize=15;
int button1x=55;
int button1y=150;
int buttonwidth=150;
int buttonheight=50;
int button2x=225;
int button2y=150;

ReactionTime reactionTime;
MouseAccuracy mouseAccuracy;

void setup() {
  size(500, 500);
}
void mousePressed() {
  if (state==0) {
    if (mouseX>button1x && mouseX<button1x+buttonwidth && mouseY>button1y && mouseY<button1y+buttonheight) {
      state=1 ;
      mouseAccuracy= new MouseAccuracy();
    } 
    if (mouseX>button2x && mouseX<button2x+buttonwidth && mouseY>button2y && mouseY<button2y+buttonheight) {
      state=2 ;
      reactionTime= new ReactionTime();
    }
  } else if (state==2) {
    reactionTime.click();
  } else if (state==1) {
    mouseAccuracy.click();
  }
}
void startgame() {

  fill(255, 255, 255);
  rect(button1x, button1y, buttonwidth, buttonheight);
  rect(button2x, button2y, buttonwidth, buttonheight);
  textSize(textSize);
  fill(0, 0, 0);
  text("Mouse Accuracy", textx1, texty1); 
  fill(0, 0, 0);
  text("Reaction Time", textx2, texty2);
}


void draw() {
  if (state==0) {
    startgame();
  } else if (state==2) {
    reactionTime.play();
  } else if (state==1) {
    mouseAccuracy.play();
  }
}
