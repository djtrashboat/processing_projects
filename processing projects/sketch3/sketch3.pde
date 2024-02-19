float vx = random(5,10);
float vy = random(4,8);
float px = random(400, 800);
float py = random(300, 600);

void setup(){
  size(1200,700);
  background(50);
  noStroke();
}

void draw(){
//  background(50);
  fill(230);
  ellipse(px, py, 32, 32);
  // change position
  px += vx;
  py += vy;
  //change dir
  if (px>=width || px<= 0){
   vx = -vx;
  }
  if (py>=height || py<= 0){
   vy = -vy;
  }
}
