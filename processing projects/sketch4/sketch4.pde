/*enum Quad{
  TOPLEFT,
  TOPRIGHT,
  BOTRIGHT,
  BOTLEFT;
}*/

final int TOPLEFT = 1;
final int TOPRIGHT = 2;
final int BOTRIGHT = 3;
final int BOTLEFT = 4;

int prev_quad = 0;

void setup(){
  size(1200,700);
}

void draw(){
  background(55);
  if (prev_quad != returnQuad()){
    prev_quad = returnQuad();
    fill(random(0,255), random(0,255), random(0,255));
  }  
  switch(prev_quad){
    case TOPLEFT:
     // fill(255);
      rect(0,0, width/2, height/2);
      break;
    case TOPRIGHT:
     // fill(255);
      rect(width/2,0, width/2, height/2);
      break;
    case BOTRIGHT:
      //fill(255);
      rect(width/2,height/2, width/2, height/2);
      break;
    case BOTLEFT:
     // fill(255);
      rect(0,height/2, width/2, height/2);
      break;
  }
    line(width/2, 0, width/2, height);
    line(0, height/2, width, height/2);
    
    
  
}

int returnQuad(){
  if(mouseY <= height/2){
    if(mouseX <= width/2){
      return TOPLEFT;
    }else{
      return TOPRIGHT;
    }
  }else{
    if(mouseX <= width/2){
      return BOTLEFT;
    }else{
      return BOTRIGHT;
    }
  }
}
