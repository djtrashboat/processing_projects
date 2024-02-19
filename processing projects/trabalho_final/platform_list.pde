class PlatformList{
  ArrayList<Platform> ps = new ArrayList<Platform>();//lista de plataformas
  int n;//numero de plataformas
  
  PlatformList(){
    n=0;//inicialmente a lista possui 0 elementos
  }
  
  void addPlatform(float tx, float ty, float sx, float sy){//funcao que adiciona uma plataforma `a lista
    ps.add(new Platform(tx, ty, sx, sy));//adiciona
    n++;//incrementa o número
  }
  
  void addPlatform(float tx, float ty){//mesma funcao que adiciona uma plataforma `a lista, mas dessa vez ela nao usa os parametros de tamanho e cria com os parametros padroes (150,20)
    ps.add(new Platform(tx, ty));
    n++;
  }
  
  void display(){
    for(int i=0; i<n; i++){//for que chama display() de todas as plataformas na lista
      Platform p = ps.get(i);
      p.display();
    }
  }
  
  boolean checkPlayer(Player play){//checa se o player  esta em alguma plataforma
    for(int i=0; i<n; i++){//para cada plataforma na lista
      Platform p = ps.get(i);
      if(p.checkPlayer(play.x,play.y,play)){//a plataforma tem uma funcao check polayer que [e chamada aqui
        return true;//se o player estiver na plataforma, a funcao retorna true e n precisa mais checar as outras plataformas
      }
    }
    return false;//se ele sair do loop sem retornar true, ele retorna false
  }

  void setNew(int listpos, float tx, float ty, float sx, float sy){//list pos é a posiçao na lista da plataforma que será mudada
    Platform p = ps.get(listpos);
    p.setNew(tx,ty,sx,sy);
  }
  void setNew(int listpos, float tx, float ty){//list pos é a posiçao na lista da plataforma que será mudada
    Platform p = ps.get(listpos);
    p.setNew(tx,ty,80,40);
  }

  int getN(){
    return n;
  }
}
