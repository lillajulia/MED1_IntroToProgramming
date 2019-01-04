class MouseAccuracy {
  float [] scores= new float [5];
  int round=0;
  int time=0;
  float nextClick=0;
  float avgScore=0;
  int reactionState=0; //0-wait 1-click 2-score 
  float squarex;
  float squarey;
  int squareheight=25;
  int textx2=100;
  int texty2=210;
  int restartbuttonx=80;
  int restartbuttony=180;
  int restartwidth=100;
  int restartheight=50;
  MouseAccuracy () {  
    time= millis();
    nextClick=random(1, 5); 
    background(0, 0, 0);
    fill(255, 255, 255);
      text("Click on the white cube!", textx1, texty1);
  }
  void play () {
    if (time+nextClick*1000<millis()) {
      reactionState=1;
      fill(255, 255, 255);
      rect(squarex, squarey, squareheight, squareheight);
    }
    if (round==5) {
      for (int i=0; i<5; i++) {
        avgScore=scores[i]+avgScore;
        println(scores[i]);
      } 
      avgScore=avgScore/5;
      fill(255, 255, 255);
      text("Average Score " + avgScore+"ms" , textx1, texty1);
      stroke(255,255,255);
      fill(0,0,0);
      rect(restartbuttonx,restartbuttony,restartwidth,restartheight);
      
      
      noLoop();
    }
  }
  void click () {
    if (reactionState==0) {
      time=millis();
    }
    if (reactionState==1 && mouseX >= squarex && mouseX <= squarex + squareheight && mouseY >= squarey && mouseY <= squarey + squareheight) { 
      reactionState=1;
      squarex=random(50, 450);
      squarey=random(50, 450);
      fill(255, 255, 255);
      rect(squarex, squarey, squareheight, squareheight);
      background(0, 0, 0);
      scores[round]=millis()-(time+nextClick*1000); 
      nextClick=random(1, 5); 
      time=millis();
      round++;
      reactionState=0;
    }
    
  
}
}
