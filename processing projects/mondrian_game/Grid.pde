class Grid{
  //int x,y;
  
  int x= 5;
  int y = 5;
  int squaresizex;
  int squaresizey;
  
  Squares[][] matriz = new Squares[x][y];
  
//  for(int i=0;i<y;i++){
//    println(i);
//  }
  
  
  Grid(int tx, int ty){
    int x = ty;
    int y = ty;
    int squaresizex = width/x;
    int squaresizey = (width/4)/y;
    
    //Squares[][] matriz = new Squares[x][y];
    for(int i=0; i<y; i++){
      for(int j=0; j<x; j++){
        matriz[i][j] = new Squares(i*squaresizex,j*squaresizey,squaresizex,squaresizey);
        matriz[i][j].display();
        //println(matriz[i][j].x);
      }
    }
    
  }
  
  void update(){
    for(int i=0; i<y; i++){
      for(int j=0; j<x; j++){
        //println(i);
        matriz[i][j].ballhit();
      }
    }
  }
  
  void display(){
    for(int i=0; i<y; i++){
      for(int j=0; j<x; j++){
        //println(i);
        matriz[i][j].display();
      }
    }
  }
}
