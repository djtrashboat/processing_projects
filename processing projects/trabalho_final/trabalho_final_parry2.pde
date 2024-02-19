Player p = new Player(0.7, 50, 50, 8, 15);
PlatformList platforms = new PlatformList();//fiz uma classe que é uma lista de plataformas, com ela consigo gerenciar melhor todas as plataformas sem ter que chamá-las uma a uma
ParryList parryables = new ParryList();
Animator idle, run, jump;
Timer time;


//************ */
boolean started = false;
int platformChanger = 0;
int level = 1;
//************ */


void setup() {
  //size(1200, 800, P2D);
  frameRate(60);
  fullScreen(P2D);//esse P2D define que o programa vai ser 2d e ele roda mais liso colocando isso
  noStroke();
  
  time = new Timer();
  
  idle = new Animator("idle",10);
  idle.setSize(0.3);
  run = new Animator("run",12);
  run.setSize(0.3);
  jump = new Animator("jump",12);
  jump.setSize(0.3);


  //adicionando plataformas a lista de plataformas (funciona igual criar um retangulo qualquer, com argumentos posicao x, posicao y, largura e altura, colocando apenas 2 argumentos ele cria uma plataforma de um tamanho padrao)
  levelOne();
  levelTwo();


  //adionar os parryables
  //parryables.addParry(700,400);
  //parryables.addParry(900,400);
  //parryables.addParry(1200,400);
}

void draw() {
  background(55);
  levelManager();

  //translate(-p.x+width/2+width/6*p.direction,0);

  //camera
  p.playerCamera();

  //platforms
  platforms.display();//mostra todas as plataformas da lista
  
  
  //parryables 
  parryables.display(); 
  
  //UI
  //time.display();
  if(started){
    time.update();
    time.display();
    
  }else{

    levelTutorial();
  }

  //player
  
  
  p.update();
  p.isOnFloor( platforms.checkPlayer(p) );//is on floor eh uma funcao do player que recebe uma booleana e seta a variavel "floored" com o valor que recebeu, no caso, quem checa se o player esta no chao sao as plataformas, que retornam se o player esta la ou nao, aqui esse valor eh passado para o player
  p.parry();
  p.display();
  
}


void keyPressed() {

  if (keyCode==UP)
  {
    //println("up");
    p.setUp(true);
  }
  if (keyCode==RIGHT) {
    //println("right");
    p.setRight(true);
  }
  if (keyCode==LEFT) {
    //println("left");
    p.setLeft(true);
  }
  if (keyCode==32 || keyCode==90) {//32 = spacebar

    p.setParry(true);
    p.parryfill = 0;
  }
  if (keyCode == ENTER && p.getX()>=3350 && p.getX()<=3550 && p.getY()>=100) {
    //rect(3350, 100, 200, 200);
    startGame();
  }

}

void keyReleased() {

  if (keyCode==RIGHT) {
    p.setRight(false);
    
    //p.velocidade=2;
  }
  if (keyCode==LEFT) {
    p.setLeft(false);
    
    //p.velocidade=2;
  }
  if (keyCode==UP) {
    p.setUp(false);
  }
  if (keyCode==32 || keyCode==90) {//32 = spacebar

    //p.setParry(false);
  }
}

void startGame(){
  if(!started){
    started = true;
    p.cameraY += 300;
  }
  
}
