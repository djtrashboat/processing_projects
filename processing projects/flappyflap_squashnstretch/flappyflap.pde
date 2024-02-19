Player p = new Player(50, 8);

void setup(){
  size(800,600,P2D);
  noStroke();
}

void draw(){
  background(55);
  p.display();
  p.update();
}

void mousePressed(){
  p.jump();
}
