class Obstaculos{
  ArrayList<Triangle> ts = new ArrayList<Triangle>();
  int n;
  Obstaculos(int n){
    for(int i=0; i<n; i++){
      ts.add(new Triangle(random(300,2000), random(-700,0)));
    }
  }
  
  void display(){
    for(int i=0; i<ts.size(); i++){
      Triangle t = ts.get(i);
      t.update();
    }
  }
  void addTriangle(){
    ts.add(new Triangle(random(0,width), random(-20,0)));
  }
  
  boolean checkHit(float px, float py, float phitbox){
    for(int i=0; i<ts.size(); i++){
      Triangle t = ts.get(i);
      if(t.checkHit(px, py, phitbox)){
        println("hit");
        noLoop();
        return true;
      }
    }
    return false;
  }
}
