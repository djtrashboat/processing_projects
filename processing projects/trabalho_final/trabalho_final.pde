class Animator {

  PImage[] sprites;
  int frameNumber;
  float frameDuration;
  float flipDirection = 1;
  float size = 1;

  Animator(String name, int number) {
    createSprite(name, "png", number);
  }

  void createSprite(String imagePrefix, String extension, int number) {
    frameNumber = number;
    sprites = new PImage[frameNumber]; 
      for (int i = 0; i < frameNumber; i++) {
      String fileName = imagePrefix + nf(i, 3) + "." + extension;
      sprites[i] = loadImage(fileName);
    }
  }
    void display(float x, float y) {
    pushMatrix();
    translate(x,y);
    scale(size*flipDirection,size);

    frameDuration = (frameDuration + 0.25)%(frameNumber);

    image(sprites[floor(frameDuration)], 0, 0);
    scale(1/(size*flipDirection),1/(size));
    popMatrix();
  }
  
void setSize(float s) {
    size = s;
  }  
  
  void flip(int i) {
    flipDirection = i;
  }
  }
