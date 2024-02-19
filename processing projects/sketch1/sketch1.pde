final int alph = 150;
int xplace = 0;

void setup(){
  size(1200,800);
}

void draw(){
   background(#BBBBBB);
  
  fill(#000000);
  rect(xplace,400, 600, 200);
  
  fill(#FFFFFF);
  rect(300,200, 600, 200);
  
  fill(255,255,0,alph);
  ellipse(300,400, 400, 400);
  fill(0,255,255,alph);
  ellipse(600,400, 400, 400);
  fill(255,0,255,alph);
  ellipse(900,400, 400, 400);
  
  line(0,0,300,300);
  line(0,20,200,220);
  
  xplace += 5;
}
