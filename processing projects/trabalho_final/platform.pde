class Platform{
  float x,y;
  float sizeX, sizeY;
  
  Platform(float tx, float ty, float sx, float sy){//construtor da plataforma com os tamanhos
    x = tx;
    y = ty;
    sizeX = sx;
    sizeY = sy;
  }
  
  Platform(float tx, float ty){//construtor das plataformas usando os valores padrao
    x = tx;
    y = ty;
    sizeX = 160;
    sizeY = 40;
  } 
  
  void display(){
    fill(#7CC9A8);    
    rect(x,y,sizeX,sizeY);
  }
  
  boolean checkPlayer(float px, float py, Player play){
    
    float reach = play.sizeX * 0.7;//reach eh metade do tamanho do player, tenho que mudar isso depois, passando tamanho como argumento e dividindo ele por 2 aqui
    
    if((px + reach/2 > x && px - reach/2 < x + sizeX) && (py + reach < y + sizeY/1.5   &&   py + reach > y )){//checa se o player esta ou nao esta
      play.y = y - reach;
      return true;//se estiver, retorna true
    }
    return false;//se nao, retorna false
  }

  void setNew(float tx, float ty, float sx, float sy){
    x = tx;
    y = ty;
    sizeX = sx;
    sizeY = sy;
  }
    
}
