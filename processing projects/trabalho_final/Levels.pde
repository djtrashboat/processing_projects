/**
x padrao da plataforma = 160

altura pulo +- 150,
pulos na pontinha --> pulos dificeis
	150 em y, 260 em x (260 + 160 = 420)
	0 em y, 340 em x (340 + 160 = 500)
 */
 
void levelTutorial(){
  //checa barreira horizontais, que estao presentes apenas antes do jogo iniciar 
  float px = p.x;
  float py = p.y;
  
  //checar todas as barreiras da esquerda para a direita
  //subtraindo 25 (fiz uns testes pra chegar nesse valor) do valor inicial do x da plataforma pra ele nao entrar nela
  if((px>700-25 && px<750 && py>600) || (px>1850-25 && px<1900 && py>400) || (px>3150-25 && px<3200 && py>300) ){
    //p.setRight(false);
    p.velocityX = -10;
  }
  //mesma coisa, só que da direita para a esquerda, agora adiciona 25 no x
  if(px<900+50 && px>850 && py>600){
    //p.setRight(false);
    p.velocityX = 10;
  }
  
  //area de onde clica enter para comecar o jogo
  fill(0,255,0, 100);
  rect(3350, 100, 200, 200);

  //textos do tutorial
  textSize(32);
  fill(255);
  text("pressione ENTER dentro da área verde para comecar o jogo", 3100, 100);
  text("pressione BARRA DE ESPAÇO ou Z para usar parry", 2400, 650);
  text("funciona nas áreas rosas e permite um pulo extra", 2400, 690);
  text("(dica: mantenha a tecla para cima apertada)", 2400, 730);
}

void levelOne(){
  //chao 1
  platforms.addPlatform(0, 750, 3151, height);//      0
  
  //plataformas horizontais
  platforms.addPlatform(700, 600, 200, 200);//        1
  platforms.addPlatform(1850, 400, 200, 600);//       2
  //chao 2
  platforms.addPlatform(3150,300,3000, height);//     3


  //plataformas verticais (normais)
  platforms.addPlatform(1100, 500);//                 4
  platforms.addPlatform(1450, 500);//                 5
  platforms.addPlatform(2550, 400);//                 6
  //platforms.addPlatform(3150,400);


  //parryables
  parryables.addParry(2630,550);
  parryables.addParry(2950,350);
  

  //plataformas usadas = 7
}
void levelTwo(){
    
  platforms.addPlatform(3600, 150);//0
  platforms.addPlatform(3900, 50);//1
  platforms.addPlatform(4200, -100); //2  
  platforms.addPlatform(4500, -200);//3
  platforms.addPlatform(4900, -200);//4   
  platforms.addPlatform(5300, -300, 500, 40);//5
    //parry1
  platforms.addPlatform(4300, -500, 500, 40);//6
    //parry2

  parryables.addParry(5050, -400);//parry1
  parryables.addParry(4550, -700);//parry2
    //plataformas usadas = 7

    //level 3>>>>>>
  platforms.addPlatform(2500, -850, 2200, 40);// total = 15
}

void levelThree(){
  platforms.setNew(platformChanger,4400, -1000, 300, 40);//0
  incrementLevelChanger();
  platforms.setNew(platformChanger,4100, -1100, 100, 40);//1
  incrementLevelChanger();
  platforms.setNew(platformChanger,3750, -1100);//2
  incrementLevelChanger();
  platforms.setNew(platformChanger,3500, -1100);//3
  incrementLevelChanger();
  //parry1
  platforms.setNew(platformChanger,3000, -1100);//4
  incrementLevelChanger();
  //parry2
  platforms.setNew(platformChanger,3000, -1200);//5
  incrementLevelChanger();
  platforms.setNew(platformChanger,3000, -1400, 2000, 40);//6
  incrementLevelChanger();


  //parrys
  parryables.addParry(3250, -1200);
  parryables.addParry(3040, -1300);
}

void levelFour(){
  platforms.setNew(platformChanger,3000, -1550);//0
  incrementLevelChanger();
  //parry 1, 2 e 3
  platforms.setNew(platformChanger,3300, -2150);//1
  incrementLevelChanger();
  platforms.setNew(platformChanger,3300, -2300, 500, 40);//2
  incrementLevelChanger();
  platforms.setNew(platformChanger,4000, -2300, 300, 40);//3
  incrementLevelChanger();
  platforms.setNew(platformChanger,4400, -2400, 300, 40);//4
  incrementLevelChanger();
  platforms.setNew(platformChanger,4000, -2500, 300, 40);//5
  incrementLevelChanger();
  //parry4
  platforms.setNew(platformChanger,3000, -2800, 2000, 40);//5
  incrementLevelChanger();


  parryables.addParry(3100, -1700);//parry1
  parryables.addParry(3350, -1800);//parry2
  parryables.addParry(3500, -2000);//parry3
  parryables.addParry(4150, -2650);//parry4
}
















void incrementLevelChanger(){
  if(platformChanger<platforms.getN()){
    platformChanger++;
  }else{
    platformChanger = 0;
  }
}

void levelManager(){
  if(level<=2 && p.getY()<=-800){
    level = 3;
    levelThree();
  }else if(level<=3 && p.getY()<=-1200){
    level = 4;
    levelFour();
  }

}
