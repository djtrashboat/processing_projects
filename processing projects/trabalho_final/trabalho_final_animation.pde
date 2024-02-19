class Parryable {
  float x, y;
  float sizeX, sizeY;
  
  Parryable(float tx, float ty, float sx, float sy){
    x = tx;
    y = ty;
    sizeX = sx;
    sizeY = sy;
  }
  
  void display(){
    fill(#f01055);    
    ellipse(x,y,sizeX,sizeY);
  }
  
  boolean checkPlayer(float px, float py, Player play){
    
    float reach = play.sizeX;
    
    if(dist(px,py,x,y) < reach){//checa se o player esta ou nao esta
      return true;
    }
    return false;
  }
  
}
