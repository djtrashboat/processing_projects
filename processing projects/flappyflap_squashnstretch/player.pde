class Player{
  float x,y;
  float size;
  float velocity = 0;
  final float GRAVITY = 0.5;
  float jumpstr = 8;
  
  Player(float ts, float str, float tx, float ty){
    x = tx;
    y = ty;
    size = ts;
    jumpstr = str;
  }
  
  Player(float ts, float str){
    x = 100;
    y = 300;
    size = ts;
    jumpstr = str;
  }
  
  void update(){
    y+=velocity;
    velocity += GRAVITY;
    
    if(y>height){
      bounce();
    }
  }
  
  void display(){
    fill(200);
    //ellipse(x,y,size,size);    
    ellipse(x,y,size + 5 - vmodule() ,size + (vmodule()));//com squash and stretch
  }
  
  void jump(){
    if(y>0){
      velocity = -jumpstr;
    }
  }
  
  void bounce(){
    velocity = -0.8*vmodule();
  }
  
  float vmodule(){//retorna o modulo da velocidade
    if(velocity>=0){
      return velocity;
    }else{
      return -velocity;
    }
  }
}
