void setup(){
  size(800,600);
  //background(55);
  //noStroke();
}

void draw(){
  background(255);
  
  noStroke();
  fill(255, 0, 0, mouseY*255/height);
  
  rectMode(CENTER);
  rect(mouseX/2, height/2, mouseX, mouseX); 
  ellipse(mouseX+mouseX/2, mouseY, mouseX, mouseX);
  
  stroke(0);
  strokeWeight(2);
  noFill();
  //fill(0,255,255,126);
  arc(width/2, height/2, (mouseY*255)/height, (mouseY*255)/height, 0, (mouseX*2*PI)/width);
  
}

/*

*/
