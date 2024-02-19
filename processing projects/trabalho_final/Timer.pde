class Timer{

  int time;
  int framespersecond;
  
  float x, y;

  Timer(){
    framespersecond = (int)frameRate;//transformando em int aqui para n'ao ter que castar todo frame
    time = 0;
    x = 50;
    y = 50;
  }
  
  void update(){
    time++;
    x = p.x - 20;
    y = p.y - 110;
  }

  void display(){
    //float minutes = time/framesperminute;
    int seconds = time/framespersecond;
    //println(seconds/60,":", seconds%60);
    //println(time/frameRate);

    textSize(32);
    fill(255);
    String t = str(seconds/60) + (":") + str(seconds%60);
    text( t, x, y);

  }


}
