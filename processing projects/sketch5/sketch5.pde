int spacing = 20;
int linex = 0;

void setup(){
  size(1200,700);
  stroke(200);
}

void draw(){
  background(55);
  //spacing = mouseX;
  for(linex = mouseX; linex <= width; linex = linex+spacing){
    if(linex < 1){
      break;
    }
     spacing = linex;
     line(linex, 0, linex, height);
  }
}
