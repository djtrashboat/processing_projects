float t = 0;
final static int NUM_LINES = 20;
float speed = 0.01;
float shade = 0;
float weight = 1;

void setup() {
  size(800,600, P2D);
  stroke(255);
  background(0);
}

void draw() {
  background(55);
  translate(width/2, height/2);
  //line(t,t,x(t),y(t));
  t+=speed;
  
  shade = 0;
  //stroke(shade);
  //strokeWeight(1);
  for(int i=0; i<NUM_LINES; i++){
    shade=255*((float)i/NUM_LINES);
    stroke(shade);
    
    //weight = 10*((float)i/NUM_LINES);
    strokeWeight(weight * 10);
    
    line(y(t+i),x(t+i),x(t+i),y(t+i));
    //line(x(t+i),x(t+i),y(t+i),y(t+i));
    //shade=255*((float)i/NUM_LINES);
    //stroke(shade);
    //line(y(t+i),y(t+i),x(t+i),x(t+i));    
  }
}

float x(float tx){
  return 150*sin(tx);
}

float y(float ty){
  return 150*cos(ty);
}
