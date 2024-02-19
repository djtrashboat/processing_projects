final int BLUE = 0;
final int YELLOW = 1;
final int RED = 2;

Ball ball;
Pedal pedal;
Grid grid;

void setup(){
  size(1280,720);
  strokeWeight(3);
  ball = new Ball(width/2, height/2, 25);
  pedal = new Pedal(200, 30);
  grid = new Grid(5,5);
  
}

void draw(){
  background(255);
  
  grid.display();
  grid.update();
  
  ball.checkPedal();
   
  pedal.update();
  pedal.display();
  
    
  ball.update();
  ball.display();
  ball.edges();
  
}

void mousePressed(){
    if(mouseButton == LEFT){
    pedal.changecolorleft();
    }else{pedal.changecolorright();}
}
