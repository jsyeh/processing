PImage img;
void setup(){
  size(1024,768);
  img=loadImage("finder_error.png");
}
float errorX=0, errorY=0;
float errorVX=10, errorVY=0;
void draw(){
  image(img, errorX, errorY, 300, 110);
  if(errorX+300+errorVX>1024 || errorX+errorVX<0){
    errorVX=-errorVX;
  }
  if(errorY+110+errorVY>768 || errorY+errorVY<0){
    errorVY=-errorVY;
  }
  errorX+=errorVX;
  errorY+=errorVY;
  errorVY+=3;
  if(errorY+errorVY+110>768){
    errorVY*=-0.92;
  }
  if(errorVY<3 && errorVY>-3 && errorY+110>600){
    errorY=0;
  }
}
void keyPressed(){
  if(key=='s') saveFrame("ans.jpg");
  if(key==' ') errorY=0;
}
