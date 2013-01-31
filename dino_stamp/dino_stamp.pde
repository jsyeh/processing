PImage dino;
float dinoX, dinoY;
float dinoVY=0, life=0;
float dinoSize=150;
void setup(){
  dino=loadImage("dino.png");
  size(1024,768);
}
void draw(){
  image(dino, dinoX,dinoY, dinoSize,dinoSize);
  if(life>0){
    if(dinoVY>10) dinoVY=0;
    else dinoVY+=0.7;
    dinoY+=dinoVY;
    life--;
  }
}
void keyPressed(){
  if(key==' '){
    dinoVY=-10;
    life=30;
    dinoSize+=10;
  }
}
void mouseMoved(){
  dinoX=mouseX-75;;
  dinoY=mouseY-75;
}
