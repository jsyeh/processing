class ball{
  float ballX=600,ballY=400;
  float ballVX=0, ballVY=0;
  float s=100;
  color c=color(255,0,0);
  ball(int x, int y, color c0){
    ballX=x; ballY=y; c=c0;
  }
  void draw(){
    fill(c);
    ellipse(ballX, ballY, s,s);
    s*=1.01;
    if(s>3000) c=color(255);
    if(s>5000) restart();
    ballVY+=0.8;
    ballX+=ballVX;
    ballY+=ballVY;
    if(ballY>750 || ballY<50){
      ballVY=-ballVY;
    }
    if(ballX<50 || ballX>1150){
      ballVX=-ballVX;
    }
  }
}
ball ball1=new ball(100,200,color(0,255,0));
ball ball2=new ball(300,200,color(255,0,0));
ball ball3=new ball(500,200,color(0,255,0));
ball ball4=new ball(700,200,color(255,0,0));
ball ball5=new ball(900,200,color(0,255,0));
ball ball6=new ball(1100,200,color(255,0,0));
float ballX=600,ballY=400;
float ballVX=0, ballVY=0;
void restart(){
  ball1=new ball(100,200,color(0,255,0));
  ball2=new ball(300,200,color(255,0,0));
  ball3=new ball(500,200,color(0,255,0));
  ball4=new ball(700,200,color(255,0,0));
  ball5=new ball(900,200,color(0,255,0));
  ball6=new ball(1100,200,color(255,0,0));
}
void setup(){
  size(1200,800);
  restart();
}
void draw(){
  background(255);
  ball1.draw();
  ball2.draw();
  ball3.draw();
  ball4.draw();
  ball5.draw();
  ball6.draw();
/*  drawBall(ballX,ballY, color(0,255,0));
  ballX+=ballVX;
  ballY+=ballVY;
  ballVY+=0.8;
  if(ballY>750 || ballY<50){
    ballVY=-ballVY;
  }
  if(ballX<50 || ballX>1150){
    ballVX=-ballVX;
  }*/
}
void drawBall(float x, float y, color c){
  fill(c);
  ellipse(x,y,100,100);  
}
void keyPressed(){
  if(key==CODED && keyCode==RIGHT){
    ball1.ballVX+=10;
    ball2.ballVX+=10;
    ball3.ballVX+=10;
    ball4.ballVX+=10;
    ball5.ballVX+=10;
    ball6.ballVX+=10;
  }else if(key==CODED && keyCode==LEFT){
    ball1.ballVX-=10;
    ball2.ballVX-=10;
    ball3.ballVX-=10;
    ball4.ballVX-=10;
    ball5.ballVX-=10;
    ball6.ballVX-=10;
  }
}
