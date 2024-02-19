class Squares{
  boolean active = true;
  float x,y;
  float sizex, sizey;
  int squarecolor;
  
  Squares(float tx,float ty,float sx,float sy){
    squarecolor = (int)random(4);
    x=tx;
    y=ty;
    sizex=sx;
    sizey=sy;
    switch(squarecolor){
      case BLUE:
        fill(0,0,255);
        break;
      case YELLOW:
        fill(255,255,0);
        break;
      case RED:
        fill(255,0,0);
        break;
      default:
        squarecolor = RED;
        fill(255,0,0);
        break;
    }
  }
  
  void display(){
    if(active){
      switch(squarecolor){
        case BLUE:
          fill(0,0,255);
          break;
        case YELLOW:
          fill(255,255,0);
          break;
        case RED:
          fill(255,0,0);
          break;
        default:
          fill(255,0,0);
          break;
      }
      rect(x, y, sizex, sizey);
    }}
  void ballhit(){
    if(active){
      float ballx = ball.x;
      float bally = ball.y;
      if(ballx>=x && ballx<=x+sizex){
        if(bally<=bally && bally<=y+sizey){
          int quad = 0;
          println((ballx-x)/sizex, (bally-y)/sizey);
          if(((bally-y)/sizey)>(ballx-x)/sizex){
            if(((bally-y)/sizey)+(ballx-x)/sizex > 1){
              println("baixo");
              quad = 1;
            }else{
              println("esquerda");
              quad = 2;
            }
          }else{
            if(((bally-y)/sizey)+(ballx-x)/sizex > 1){
              println("direita");
              quad = 2;
            }else{
              println("topo");
              quad = 3;
            }
          }
          
          ball.onsquarehit(squarecolor, quad);
          //println("hit ", quad);
          active = false;
        }
      }
    }
  }
}
