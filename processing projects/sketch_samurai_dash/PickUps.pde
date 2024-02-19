class PickUps{
  float x,y,size;
  
  int green = 200;
  int blue = 0;
  int colordirection = 0;//0: g->c; 1: c->b; 2: b->c; 3: c->g;
  
  PickUps(float tx, float ty, float ts){
    x = tx;
    y = ty;
    size = ts;
  }
  
  void display(){
    rectMode(CORNER);
    //fill(#4DC63E);
    fill(0, green, blue);
    rect(x,y,size,size);
    changeColor();
    
  }
  
  boolean checkHit(float px, float py, float phitbox){
    if((px+phitbox>x && px-phitbox<x+size) && (py+phitbox>y && y+size>py-phitbox)){
      return true;
    }
    return false;
  }
  
  void newPosition(){
    x = random(0+size, width-size);
    y = random(0+size, height-size);
  }
  
  void changeColor(){
    /*
    if(colordirection==0){
      blue++;
      if(blue>=200){
        colordirection = 1;
      }
    }else if(colordirection==1){
      green--;
      if(green<=0){
        colordirection = 2;
      }
    }*/
    switch (colordirection){
    
      case 0:
        blue+=10;
        if(blue>=200){
          colordirection = 1;
        }
        break;
      case 1:
        green-=10;
        if(green<=0){
          colordirection = 2;
        }
        break;
      case 2:
        green+=10;
        if(green>=200){
          colordirection = 3;
        }
        break;
      case 3:
        blue-=10;
        if(blue<=0){
          colordirection = 0;
        }
        break;
      
    }
  
}
   
}
