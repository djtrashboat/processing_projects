void setup(){
  size(1200,800);
  strokeWeight(0);
}

int something = 0;

void draw(){
  float colorR = (float(mouseX)/width) * 255;
  float colorG = float(mouseY)/height * 255;
  float colorB = (colorR+colorG)/2;

  background(colorR, colorG, colorB);
  
  createcircle(-1, colorR, 0);
  createcircle(0, colorG, 1);
  createcircle(1, colorB, 2);
  
}

void createcircle(int offset, float circlecolor, int colorpos){
  offset = offset * 50 * something;
  switch(colorpos){
  case 0:
    fill(circlecolor, 0, 0, 128);
    break;
  case 1: 
    fill(0, circlecolor, 0, 128);
    break;
   case 2: 
    fill(0, 0, circlecolor, 128);
    break;
  }
  ellipse(mouseX + offset, mouseY, 50, 50);
}

void mousePressed(){
  if (something == 0){
      something = 1;
  }else{
    something =0;
  }
}
