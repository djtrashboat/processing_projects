Player p = new Player(200,500,60);
Obstaculos ts = new Obstaculos(1);
PickUps pick = new PickUps(600,300,40);

int points = 0;

final float hbox = p.hitBox();//calcula uma constante que é usada para alguns cálculos da hitbox do player


void setup(){
  //size(1200,700, P2D);
  fullScreen(P2D);
  smooth();
  noStroke();
}

void draw(){
  background(#E8E8D7);
  //background(#DECEA8);
  
  //player
  p.update();
  p.display();
  
  //obstaculos
  ts.display();
  //ve se o obstáculo acertou o player
  ts.checkHit(p.getX(), p.getY(), hbox);
  
  //pickup de ponto
  pick.display();
  if(pick.checkHit(p.getX(), p.getY(), hbox)){//se o player pegou o ponto
    points++;
    pick.newPosition();
    println(points);
    ts.addTriangle();
  }
}


/*

//MOVIDO PARA A ABA DO PLAYER
void mousePressed(){
  p.mousePressed();
}

void mouseReleased(){
  p.mouseReleased();
}
*/
