// A polar coordinate 
float r = 0; 
float theta = 0;
float clr=0;
float thick=0;


void setup() {  
  size(200, 200);  
  background(255);
}
void draw() {   
  float x = r * cos(theta);  
  float y = r * sin(theta);
  clr+=0.01;
  thick+=0.01;
  noStroke();  
  fill (0,0,255*noise(clr));
  ellipse(x + width/2, y + height/2, 16*noise(thick),  16*noise(thick)); 
  
    // Increment the angle  
 theta += 0.01;
 r+=0.05;
}
