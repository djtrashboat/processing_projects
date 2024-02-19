void setup(){
  size(1200,700);
  background(255);
  strokeWeight(4);
  //noStroke();
  int rows =(int) random(4,10);
  int collums =(int) random(4,10);
  
  int xspacing = width/collums;
  int yspacing = height/rows;
  
  int xpos = 0;
  int ypos = 0;
  
  for(int i=0; i<=rows; i++){
    for(int j=0; j<=collums; j++){
      
      ellipse(xpos, ypos, 5, 5);
      xpos += xspacing;
      
      println(i,j);
    }
    xpos = 0;
    ypos += yspacing;
  }
}

void draw(){
  
}

void mouseClicked(){
  background(255);
  drawRects();
}

void drawRects(){
  int rows =(int) random(4,10);
  int collums =(int) random(4,10);
  
  int xspacing = width/collums;
  int yspacing = height/rows;
  
  int xpos = 0;
  int ypos = 0;
  
  for(int i=0; i<=rows; i++){
    for(int j=0; j<=collums; j++){
      
      int getcolor = (int) random(10);
      switch(getcolor){
        case 0:
          fill(#ff0000);
          break;
        case 1:
          fill(#0000ff);
          break;
        case 2:
          fill(#ffff00);
          print(getcolor);
          break;
        case 3:
          fill(0);
          print(getcolor);
          break;
        default:
           fill(255);
           break;
      }
      //ellipse(xpos, ypos, 5, 5);
      
      rect(xpos, ypos, xspacing, yspacing);
      
      xpos += xspacing;
      
      println(i,j);
    }
    xpos = 0;
    ypos += yspacing;
  }
}
