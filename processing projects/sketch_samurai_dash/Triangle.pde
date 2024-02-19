class Triangle{
  float x, y, velocity;
  float size = random(0.5,1.5);
  Triangle(float tx, float ty){
    x = tx;
    y = ty;
    velocity = random(1,6);
  }
  
  
  void update(){
    y+=velocity;
    //velocity += 0.1;
    if(y>height+25){
      y=-20;
      x=random(0,width);
      velocity = random(1,6);
      //println(velocity);
    }
    display();
  }
  void display(){
    fill(#D83B48);
    triangle(x, y, x-(7*size), y-(25*size), x+(7*size), y-(25*size));
    
  }
  
  boolean checkHit(float px, float py, float phitbox){
    //println(y);
    if((x>px-phitbox && x<px+phitbox) && (y>py-phitbox && y<py+phitbox)){
      print("hit");
      return true;
    }    
    return false;
  }
}
