int W=640, H=480;
int floorY=H-100-100;
float marioX=0, marioY=floorY, marioVX=0, marioVY=0;
float bgX=0, bgY=0;
PImage bg;
void setup(){
  size(W,H);
  bg=loadImage("bg.png");
}
void draw(){
  image(bg, bgX, bgY);
  image(bg, bgX+1200,bgY);
  if(bgX<-1200)bgX+=1200;
  mario(marioX, marioY);
  marioMove();
}
boolean [] keys=new boolean[255];
void marioMove(){
  if(keys[RIGHT]==true){
    marioVX++;
    if(marioVX>6)marioVX=6;
  }
  if(keys[LEFT]==true){
    marioVX--;
    if(marioVX<-6)marioVX=-6;
  }
  if(keys[UP]==true){
    keys[UP]=false;
    if(marioVY==0 && marioY+100==H-100){
      marioVY= -20;
    }
  }
  marioX+=marioVX;
  marioY+=marioVY;
  if(marioX>W/2-50){
    bgX-=(marioX-W/2+50);
    marioX=W/2-50;
  }
  if(marioX<0){
    marioX=0;
  }
  marioVX*=0.9;
  marioVY+=0.98;
  if(marioY>=floorY){
    marioY=floorY;
    marioVY=0;
  }
}
void keyPressed(){
  if(key==CODED && keyCode==RIGHT){
    keys[RIGHT]=true;
  }else if(key==CODED && keyCode==LEFT){
    keys[LEFT]=true;
  }else if(key==CODED && keyCode==UP){
    keys[UP]=true;
  }
}
void keyReleased(){
  if(key==CODED && keyCode==RIGHT){
    keys[RIGHT]=false;
  }else if(key==CODED && keyCode==LEFT){
    keys[LEFT]=false;
  }else if(key==CODED && keyCode==UP){
    keys[UP]=false;
  }
}  
void mario(float X, float Y){
  rect(X,Y,100,100);
}
