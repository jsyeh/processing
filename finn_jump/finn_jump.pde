float finX=200, finY=550;
float finVX=5, finVY=0;
//float boardX=0, boardY=550, boardW=400;
class Board{
  float X, Y, W; 
  Board(int x, int y, int w){
    X=x; Y=y; W=w;
  }
  int onboard(){
    if( finX> X && finX < X+W && finY<=Y && finY+finVY>=Y) return 1;
    else return 0;
  }
}
Board [] b = new Board[10];
void setup(){
  size(400,600);
  b[0] = new Board(0, 590, 400);
  b[1] = new Board(200, 400,200);
  b[2] = new Board(0, 250, 200);
  b[3] = new Board(100,200,100);
}

void draw(){
  background(255);
  fill(0,0,255);
  ellipse(finX,finY,100,100);//draw finn as a circle
  finX+=finVX;
  if(finX>=350 || finX<=50)finVX=-finVX;

  finY+=finVY;
  finVY+=2.9;
  for(int i=0;i<3;i++){
    rect(b[i].X, b[i].Y, b[i].W, 10);
    if(b[i].onboard()==1 && finVY>0){
      finVY=0;
      finY=b[i].Y;
    }
  }
}

void keyPressed(){
  if(key==' '){
    if(finVY==0) finVY=-40;
    else background(255,0,0);
  }
}

