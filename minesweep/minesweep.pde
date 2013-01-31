LinkedList <Integer> queue = new LinkedList();
int W=20, H=10, M=30;
int [][]board = new int[W][H];
int [][]mine = new int[W+2][H+2];
boolean bShowMine=false;
void setup(){
  size(W*20,H*20);
  initMine();
}
void initMine(){
  int m=M;
  while(m>0){
    int i=(int)random(W)+1, j=(int)random(H)+1;
    if(mine[i][j]!=-1){
      mine[i][j]=-1;
      mineAddOne(i-1,j-1);
      mineAddOne(i-1,j);
      mineAddOne(i-1,j+1);
      mineAddOne(i,j-1);
      mineAddOne(i,j+1);
      mineAddOne(i+1,j-1);
      mineAddOne(i+1,j);
      mineAddOne(i+1,j+1);
      m--;
    }
  }
}
void mineAddOne(int a,int b){
  if(mine[a][b]!=-1) mine[a][b]++;
}
void draw(){
  background(255);
  drawBoard();
  if(bShowMine) drawMine();
}
void drawBoard(){
  for(int i=0;i<W;i++){
    for(int j=0;j<H;j++){
      if(board[i][j]==0){
        fill(255); rect(i*20,j*20,20,20);
      }else if(board[i][j]==1){
        fill(160); rect(i*20,j*20,20,20);
        fill(0); text(""+mine[i+1][j+1],i*20,j*20,20,20);
      }else{
        fill(255); rect(i*20,j*20,20,20);
        fill(0); text("X",i*20,j*20,20,20);
      }
    }
  }
}
void drawMine(){
  fill(255,0,0);
  for(int i=0;i<W;i++){
    for(int j=0;j<H;j++){
      if(mine[i+1][j+1]==-1){
        rect(i*20,j*20,20,20);
      }else{
        text(""+mine[i+1][j+1],i*20,j*20,20,20);
      }
    }
  }
}
void mousePressed(){
  int i=mouseX/20;
  int j=mouseY/20;
  if(mouseButton==RIGHT){
    if(board[i][j]==1) {board[i][j]=0; return;}
    else if(board[i][j]==0) {board[i][j]=2; return;}
    else if(board[i][j]==2) {board[i][j]=0; return;}
  }
  if(board[i][j]==0){
    queue.push(i);
    queue.push(j);
  }
  while(queue.size()>0){
    int b=queue.pop();
    int a=queue.pop();
    if(mine[a+1][b+1]==0 && board[a][b]==0){
      board[a][b]=1;
      test(a-1,b-1);
      test(a-1,b);
      test(a-1,b+1);
      test(a,b-1);
      test(a,b+1);
      test(a+1,b-1);
      test(a+1,b);
      test(a+1,b+1);
    }else board[a][b]=1;
  }
}
void test(int i, int j){
  if(i<0 || j<0 || i>=W || j>=H) return;
  if(board[i][j]==0){
    queue.push(i);
    queue.push(j);
  }
}
void keyPressed(){
  if(key==' ')bShowMine = !bShowMine;
}
