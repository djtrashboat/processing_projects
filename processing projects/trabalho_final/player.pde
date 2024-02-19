class Player {
  float x, y;
  float gravity;//aceleracao em Y
  float velocityX, velocityY;//velocidades atuais do player nas cordenadas x e y (diferente de speed)
  float acc, airacc;//acc = acceleration (aplicado em X), faz com que o player nao chegue na velocidade maxima em x de uma vez, ele acelera ate chegar nela (chega rapido, mas n instantaneamente). airacc vai ser usado para o controle dele ser menos no ar
  float sizeX, sizeY;
  boolean floored;//se o player esta no chao

  float cameraY;


  boolean up = false;
  boolean right = false;
  boolean left = false;
  boolean parry = false;
  int direction = 0;//-1 se left, +1 se right, 0 se nenhum deles
  int spriteDisplacement=70;


  float parryfill = TWO_PI;
  float parryTiming=0;

  float speedX, speedY;//speedX eh a velocidade maxima do player em X, speedY eh a forca do pulo dele

  int hp;

  float cameraDir=0;

  Player(float g, float szx, float szy, float spx, float spy) {
    gravity = g;
    sizeX = szx;
    sizeY = szy;


    acc = 1;
    airacc = 0.3;

    speedX = spx;
    speedY = spy;

    hp = 3;

    x = 200;//////////////////////////////////////////////////////
    y = 200;/////////////////////////////////////////////////////
    ///////////
    //
    //mudar aqui para testar os leveis
    //x = 3300;
    //y = 200;
    //
    //////////////////////////////////////////////////////
    velocityX = 0;
    velocityY = 0;
  }

  void display() {

    if (parryfill<7) {

      fill(#f01055);
      arc(x, y, 1.5*sizeX, 1.5*sizeY, PI, parryfill + PI);
      parryfill+=0.8;
    }

    fill(220, 220, 200, 20);
    //ellipse(x, y, sizeX, sizeY);
    //ellipse(x, y, sizeX, sizeY);

    //if (velocityY!=0) {
    if (!floored) {
    //if (velocityY<0) {
      if (jump.flipDirection==1) {
        jump.display(x-70, y-100);
      } else {
        jump.display(x+70, y-100);
      }
    }
    else {
    if (!left && !right) {
      if (idle.flipDirection==1) {
        idle.display(x-70, y-100);
      } else {
        idle.display(x+70, y-100);
      }
    } else {
      if (run.flipDirection==1) {
        run.display(x-70, y-100);
      } else {
        run.display(x+70, y-100);
      }
    }
  }
  }

  void update() {

    velocityY+=gravity;//velocidade em y aumenta de acordo com a gravidade

    getDirection();//le os booleanos de direcao do player para definir a direcao
    move();//move o player de acordo com a direcao recebida

    y+=velocityY;
    if (floored) {//se estiver no chao
      velocityY=0;//a velocidade em y vai ser 0 (vai deixar de cair)
    }
    //y+=velocityY;//Y vai incrementar de acordo com a velocidade atual em Y (0 se estiver no chao, outro valor se nao estiver)
  }



  void jump() {
    if (floored) {//se estiver no chao
      velocityY=-speedY;//a velocidade em y sera negativa e de modulo igual a forca do pulo dele (ou seja, vai pular)
      //y-=speedY;
      floored = false;//ele deixa de estar no chao quando pula
    }
    //else {
    //  parry();
    //} // fazer com que só seja possível dar parry no ar
  }


  void parry() {

    //println(parryfill);

    if (parry) {

      if (parryTiming<10 ) {
        parryTiming+=0.8;
        if (parryables.checkPlayer(p)) {
          velocityY=-speedY;
          //println("parry");
        }
      } else {
        parryTiming=0;
        p.setParry(false);
      }
    }
  }

  void getDirection() {//define a direcao de acordo com os booleanos recebidos pelas teclas
    if (left && !right) {
      direction = -1;
    } else if (right && !left) {
      direction = 1;
    } else {
      direction = 0;
    }
  }

  void move() {
    if (up) {
      jump();
    } else if (velocityY<0) {//permite que ele pule mais baixo se deixar a teclado UP pouco apertada
      velocityY = 0;//se up for false(ou seja, se soltou a tecla UP e a velocidade dele for negativa(pra cima), a nova velocidade dele sera 0, assim deixa de ir para cima)
    }

    if (floored) {
      acc = 1;
    } else {
      acc = 0.5;
    }

    if (direction == 1) {//se for para a direita
      //velocityX+=acc;//a velocidade aumenta de acordo com a aceleracao
      velocityX = constrain(velocityX+acc, 0, speedX);
      x+=velocityX;
      run.flipDirection=1;
      jump.flipDirection=1;
      //x+=constrain(velocityX, 0, speedX);//constrain nao deixa a velocidade passar de speedX, que eh a velocidade maxima
    } else if (direction == -1) {//mesma coisa, mas para a esquerda
      //velocityX-=acc;
      velocityX = constrain(velocityX-acc, -speedX, 0);
      //println(velocityX);
      x+=velocityX;
      //x+=constrain(velocityX, -speedX, 0);
      run.flipDirection=-1;
      jump.flipDirection=-1;
    } else {
      velocityX *= 0.8;//se a direcao nao for nem para a esquerda nem para a direita, velocidade em X sera 0
      x+=constrain(velocityX, -speedX, speedX);
    }
  }


  void isOnFloor(boolean is) {//recebe se esta no chao ou nao e define se esta
    //floored = is;
    if (is && velocityY>=0) {
      floored = is;
    } else {
      floored = false;
    }
    //println(is);
  }

  float getX() {//retorna a posicao do player
    return x;
  }
  float getY() {//retorna a posicao do player
    return y;
  }

  //definem as booleanas recebidas pelas teclas
  void setUp(boolean b) {
    up = b;
  }
  void setLeft(boolean b) {
    left = b;
    spriteDisplacement=0;
    jump.flipDirection=-1;
    idle.flipDirection=-1;
    run.flipDirection=-1;
  }
  void setRight(boolean b) {
    right = b;
    spriteDisplacement=-70;
    jump.flipDirection=1;
    idle.flipDirection=1;
    run.flipDirection=1;
  }
  void setParry(boolean b) {
    parry = b;
  }

  void playerCamera() {

    //println(cameraDir);
    if (started){
      translate(-p.x + width/2 + width/8 * cameraDir, cameraY+=0.3);
      cameraY = max(cameraY, -y);//  faz a camera acompanhar o player na vertical caso ele esteja muito avancado
    }else{
      translate(-p.x + width/2 + width/8 * cameraDir, 0);
    }

  }
}
