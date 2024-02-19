class Explosion{
  int ticks = 30;//jeito de checar se a explosao finalizou
  boolean active = true;//ela comeca ativa e depois de 30 ticks finaliza
  final int N = 30;//constante que define o numero de particulas da explosao
  //float x,y; //náo foi necessario
  Particle[] ps;//array de particulas para a explosao
  
  Explosion(float tx, float ty){//tx e ty sao passados como argumentos para a posicao inicial da particula, x e y n seriam usados para a explosao em si, so para seu inicio    
    ps = new Particle[N];//ps sera o array de N particulas que sao iniciadas com a explosao
    for(int i=0; i<N; i++){
     ps[i] = new Particle(tx,ty);
    }    
  }
  
  Explosion(float tx, float ty, float strength){//adicionei posteriormente a possibilidade de alterar a forca da explosao    
    ps = new Particle[N];
    for(int i=0; i<N; i++){
     ps[i] = new Particle(tx,ty, strength);
    }    
  }
  
  Explosion(float tx, float ty, float strength, int type){//adicionei posteriormente a possibilidade de alterar a forca da explosao    
    ps = new Particle[N];
    for(int i=0; i<N; i++){
     ps[i] = new Particle(tx,ty, strength, type);
    }    
  }
  
  void update(){
    for(int i=0; i<N; i++){//atualiza cada particula da explosao
      ps[i].update();
    }
    
    ticks--;//depois de 30 ticks, todas as particulas teráo size <=0
    if(ticks<1){
      active = false;//depois disso a explosao será considerada finalizada
    }
  }
  
  void display(){
    for(int i=0; i<N; i++){//desenha cada uma das particulas
      ps[i].display();
    }
  }
  
  boolean getActive(){
    return active;//retorna true se a explosao estiver ativa e false se ela tiver finalizada
  }
  
}
