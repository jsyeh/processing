int score=0, lastTime=60;
void setup(){
  size(500,500);
}
void draw(){
  background(0);
  textSize(60);
  text("Time:"+lastTime, 50,100);
  text("Score:"+score, 50,200);
  text("Press SPACE!",50,400);
  lastTime=60-millis()/1000;
}
void keyPressed(){
  if(key==' ') score+=100;
}
