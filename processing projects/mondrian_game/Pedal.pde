class Pedal{
  int x = width/2;
  int y = height-50;
  int sizex, sizey;
  int pedalcolor;
  
  Pedal(int sx, int sy){
    sizex = sx;
    sizey = sy;
    pedalcolor = YELLOW;
    //fill(0,0,255);
  }
  
  void update(){
    x = mouseX;
    
    switch(pedalcolor){
      case BLUE:
        fill(0,0,255);
        break;
      case YELLOW:
        fill(255,255,0);
        break;
      case RED:
        fill(255,0,0);
        break;
    }
  }
  void display(){
    rect(x - (sizex/2), y, sizex, sizey);
  }
  
  void changecolorleft(){
    if(pedalcolor>=2){
      pedalcolor = 0;
    }else{
      pedalcolor +=1;
    }}
    
   void changecolorright(){
    if(pedalcolor<=0){
      pedalcolor = 2;
    }else{
      pedalcolor -=1;
    }
  }
}
