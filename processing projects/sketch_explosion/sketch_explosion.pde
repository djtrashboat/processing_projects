ArrayList<Explosion> es = new ArrayList<Explosion>();//arraylist do tipo explosion para poder alocar e liberar espaco dinamicamente conforme explosoes sao criadas e finalizadas

void setup(){
  size(1200,700, P2D);
  noStroke();
  background(33);
}

void draw(){
  background(33);//vale a pena experimentar deixar o bg apenas no setup e tirar do draw
  
  for(int i=0; i<es.size(); i++){//para cada explosao na lista, o programa vai desenhá-las e ver se elas ainda estao ativas, a lista permite que haja mais de uma explosao simultanea
    Explosion e = es.get(i);
    e.update();
    e.display();
    if(!e.getActive()){
      es.remove(i);//se elas nao estiverem ativas, elas sao liberadas, para o programa nao entrar no loop de explosoes ja finalizadas
    }
  }
  
}

void mouseClicked(){  
  int type = (int)random(3);
  es.add(new Explosion(mouseX, mouseY, random(0.5,1.5), type));//quando o mouse e clicado, ele cria uma explosao no lugar que ele esta com uma forca entre 0.5 e 1.5
  //println(es.size());
}
