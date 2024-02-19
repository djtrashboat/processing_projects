class Ball{
  float x,y;
  int size;
  float speedx, speedy, ymodule;//ymodule evita alguns bugs e me permite manipular a vbelocidade em y com mais liberdade
  int ballcolor;
  
  
  Ball(float tx, float ty, int ts){
    x = tx;
    y = ty;
    size = ts;
    speedx = random(-3,3);
    ymodule = -3.5;
    speedy = -ymodule;
    ballcolor = YELLOW;
  }
  
  void update(){
    x += speedx;
    y += speedy;
    
    switch(ballcolor){
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
  
  void edges(){
    if(x < (size/2) || x > (width - (size/2))){
      speedx = -speedx;}
    if(y<=0){
      speedy =-ymodule;
    }
    if(y>=height){
      speedy =0;
      speedx=0;
    }
  }
  
  void display(){
    ellipse(x, y, size, size);
  }
  
  void checkPedal(){//checa se a bola bateu no pedal e muda sua direcao
    if((y +10 >= pedal.y && y -20 <= pedal.y) && (x>=(pedal.x - pedal.sizex/2) && x<= pedal.x + pedal.sizex/2) && ballcolor==pedal.pedalcolor){
      //println("hit");
      ymodule *= 1.07;
      speedy = ymodule;
      float pospedal = x - pedal.x;//retorna um numero entre -85 e 85 dependendo da posicao em que a bola bate no pedal
      speedx = pospedal / 28; // desse modo eh possivel deixar a velocidade em x da bola de acordo com a posicao em que ela bateu no pedal
    }
  }
  void onsquarehit(int newcolor, int quad){
    //speedy=-speedy;
    ballcolor = newcolor;
    switch(quad){
      case 1:
        speedy = -ymodule;
        break;
      case 2:
        speedx = -speedx;
        break;
      case 3:
        speedy = ymodule;
        break;
    }
    
  }
  
}
