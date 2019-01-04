class ReactionTime {
  float [] scores= new float [5];
  int round=0;
  int time=0;
  float nextClick=0;
  float avgScore=0;
  int reactionState=0; //0-wait 1-click 2-score 
  ReactionTime () {  
    time= millis();
    nextClick=random(1, 5); 
    background(0, 0, 0);
    fill(255, 255, 255);
      text("Click when the screen turns green!", textx1, texty1);
  }

  void play () {
    if (time+nextClick*1000<millis()) {
      reactionState=1;
      background(#0AF727);
    } 
    if (round==5) {
      for (int i=0; i<5; i++) {
        avgScore=scores[i]+avgScore;
        println(scores[i]);
      } 
      avgScore=avgScore/5;
      fill(255, 255, 255);
      text("Average Score " + avgScore+"ms", textx1, texty1); 
      noLoop();
    }
  }
  void click () {
    if (reactionState==0) {
      time=millis();
    }
    if (reactionState==1) { 

      background(0, 0, 0); 
      scores[round]=millis()-(time+nextClick*1000); 
      nextClick=random(1, 5); 
      time=millis();
      round++;
      reactionState=0;
    }
  }
}
