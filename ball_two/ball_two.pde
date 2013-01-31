PImage ball1,ball2;
void setup(){
  size(1024,768);
  ball1=loadImage("ball1.jpg");
  ball2=loadImage("ball2.jpg");
}
void draw(){
  image(ball1, mouseX, mouseY,200,200);
  image(ball2, mouseX-200,mouseY,200,200);
}
