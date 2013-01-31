float [] boardX=new float[5];
float [] boardY=new float[5];
float [] boardW=new float[5];
float finX=250,finY=500-100;
float finVX=0, finVY=0;

void setup(){
  size(500,500);
  boardX[0]=0;
  boardY[0]=500-50;
  boardW[0]=500;
  for(int i=1;i<5;i++){
    boardY[i]=boardY[i-1]-100;
    boardX[i]=random(400);
    boardW[i]=200;
  }
}

int gameOver=0;
void draw(){
  if(gameOver==1){
    background(255,0,0);
  }else{
    background(255);
  }
  fill(255,255,0);
  for(int i=0;i<5;i++){
    rect(boardX[i],boardY[i],boardW[i],50);
  }
  updateFin();
  updateBoard();                
  fill(128,128,255);
  rect(finX,finY,50,50);
}

int scrollDown=0;
void updateBoard(){
  if(finY<100) scrollDown=1;
  
  if(scrollDown==1){
    if(finY>300) scrollDown=0;
    float diff=5;
    finY+=diff;
        
    for(int i=0;i<5;i++){
      boardY[i]+=diff;
      if(boardY[i]>500){
        boardY[i] -=500;
        boardX[i]=random(400);
        boardW[i]=200;
      }
    }
  }  
}

void updateFin(){
  finX+=finVX;
  finY+=finVY;
  int onboard=0;
  for(int i=0;i<5;i++){
    if(finX+50>boardX[i] && finX<boardX[i]+boardW[i] && finY+50>=boardY[i] && finY+50<=boardY[i]+50){
      if(finY+50!=boardY[i]) finVY=0;
      finY=boardY[i]-50;
      onboard=1;
    }
  }
  finVX*=0.8;
  if(onboard==0) finVY+=0.7;
  if(finX<0 ) {finX=0; finVX=-finVX;}
  if(finX>500-50) {finX=500-50; finVX=-finVX;}
  
  if(finY>500){
    gameOver=1;
  }
}

void keyPressed(){
  if(key==' ' && finVY==0)finVY= -15;
  if(key==CODED && keyCode==LEFT)finVX=-20;
  if(key==CODED && keyCode==RIGHT)finVX=20;
}
