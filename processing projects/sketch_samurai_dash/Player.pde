class Player{
  float x;
  float y;
  float vx, vy;
  float size;
  float mx, my;
  float arcstart = 0;
  float arcend = HALF_PI;

  
  Player(float tx, float ty, float ts){
    x = tx;
    y = ty;
    vx=0;
    vy=0;
    size = ts;
  }
  
  //
  void display(){
    fill(#5367C4);
    
    arc(x,y, size, size, arcstart, arcend);    
    
    rectMode(CENTER);
    //fill(#A3BEE0);
    fill(#9673D3);
    rect(x,y, size * 0.72 , size * 0.72);//0.72 == seno de 45 /2
    
    arcstart+=0.1;
    arcend+=0.1;
        
    
  }
  //
  void update(){
    move();
    vx*=0.95;
    vy*=0.95;
  }
  
  
  
  //
  void mousePressed(){
    mx = mouseX;
    my = mouseY;
  }
  void mouseReleased(){
    setVelocity(mouseX, mouseY);
  }
  //
  void move(){
    x+=vx;
    y+=vy;
  }
  
  void setVelocity(float newx, float newy){
    vx = (newx - mx)/70;
    vy = (newy - my)/70;
  }
  
  float hitBox(){
    return 0.36 * size;
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
}
void mousePressed(){
  p.mousePressed();
}

void mouseReleased(){
  p.mouseReleased();
}
