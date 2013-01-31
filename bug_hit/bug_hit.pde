PImage bug, hammer;
float []bugX=new float[10];
float []bugY=new float[10];
int []bugLive =new int[10];
float []bugSpeed = new float[10];

void setup(){
  size(900,600);
  bug=loadImage("bug.png");
  hammer=loadImage("hammer.png");
  for(int i=0;i<5;i++){
    bugX[i]=i*-200;
    bugY[i]=300+random(200);
    bugLive[i]=1;
    bugSpeed[i]=random(2) + 2;
  }
}
int sobad=0;
int remainLife=100;
int gameOver=0;
int shift=4;
void draw(){
  if(gameOver==1){
    background(255,0,0);
    shift=0;
    sobad=100;
  }
  background(0);
  if(sobad>0){
    sobad--;
    background(255,0,0);
    remainLife--;
    if(remainLife<0) remainLife=0;
  }
  if(remainLife<=0) gameOver=1;
  textSize(80);
  text("Life: "+remainLife,100,100);
  for(int i=0;i<5;i++){
    if(bugX[i]+100>mouseX && bugX[i]<mouseX+100 && bugY[i]+100>mouseY && bugY[i]<mouseY+100){
      bugLive[i]=0;    
    }
    if(bugLive[i]==1) image(bug,bugX[i],bugY[i]);
    bugX[i]+=bugSpeed[i];;
    if(bugX[i]>900){
      bugX[i]-=1000;
      bugY[i]=300+random(200);
      if(bugLive[i]==1){
        sobad=10;        
      }
      bugLive[i]=1;
    }
  }
  
  image(hammer, mouseX, mouseY,100,100);
  if(gameOver==1){
    text("Game Over", 200,100);
  }
}


