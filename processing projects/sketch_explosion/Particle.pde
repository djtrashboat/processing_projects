class Particle{
  float x, y;
  int size;
  float yspeed, xspeed;
  boolean active = true;//a particula n sera desenhada e nem atualizada se nao estiver ativa
  float gravity = 0.7;//funciona tal qual a gravidade na vida real
  //float[] pcolor = {random(0,255), random (0,255), random(0,255)};//parece confeti e nao explosao, vale a pena testar
  float[] pcolor = {random(200,255), random (50,255), random(0,50)};//array para colocar os valores de R, G e B da cor da particula, que sera proxima do amarelo ou laranja, dando ideia de fogo
  //float[] pcolor = {random(50,255), random (200,255), 0};//VERDE AMARELADO
  //float[] pcolor = {0, random(50,255), random(200,255)};//AZUL
  
  Particle(float tx, float ty){
    //active = true;
    x = tx;
    y = ty;
    size = (int)random(10,30);// adiciona variacoes de tamanho inicial para as particulas
    yspeed = random(-20, -6);//variacoes de velocidade inicial y para a particula, o numero sera negativo pois elas sempre comecam indo para cima
    xspeed = random(-7, 7);//inicialmente a p ira ou para esquerda ou para a direita com forca de 0 a 7
  }
  
  Particle(float tx, float ty, float strength){//adiciona o argumento que varia a forca da explosao
    //active = true;
    x = tx;
    y = ty;
    size = (int)random(10,30);
    yspeed = random(-20, -6) * strength;
    xspeed = random(-7, 7) * strength;
    //xspeed = random(0, 25) * strength;
  }
  
  Particle(float tx, float ty, float strength, int type){//adiciona o argumento que varia a forca da explosao
    if(type == 1){
      //pcolor = {random(50,255), random (200,255), 0};
      pcolor[0] = random(50,255);
      pcolor[1] = random(200,255);
      pcolor[2] = 0;
      x = tx;
      y = ty;
      size = (int)random(10,30);
      yspeed = random(-20, -6) * strength;
      xspeed = random(0, 22) * strength;
    }
    else if(type == 2){
      pcolor[0] = 0;
      pcolor[1] = random(50,255);
      pcolor[2] = random(200,255);
      x = tx;
      y = ty;
      size = (int)random(10,30);
      yspeed = random(-20, -6) * strength;
      xspeed = random(-12, 4) * strength;
    }else{
      x = tx;
      y = ty;
      size = (int)random(10,30);
      yspeed = random(-20, -6) * strength;
      xspeed = random(-7, 7) * strength;
    }
     

  }
  
  void update(){
    if(active){
      x += xspeed;
      y += yspeed;
      yspeed += gravity;//adiciona a gravidade a velocidade em y, isso faz a particula ter movimento de parabola
      size --;//reduz o tamanho da particula conforme o tempo
      if(size<=0){
        active = false;}//se o tamanho for 0, a particula n sera mais ativa
    }
  }
  
  void display(){
    if(active){
      fill(pcolor[0], pcolor[1], pcolor[2]);
      ellipse(x, y, size, size);}
  }
  
}
