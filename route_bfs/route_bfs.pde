LinkedList queue = new LinkedList();
int [][]grid=new int[10][10];
int [][]fromI=new int[10][10];
int [][]fromJ=new int[10][10];
int startX=0, startY=0;
int endX=9, endY=9;
void setup(){
  size(200,200);
  for(int i=0;i<10;i++){
    for(int j=0;j<10;j++){
      grid[i][j]=-1;
    }
  }
  grid[startX][startY]=0;
  grid[endX][endY]=999;
}
void draw(){
  drawGrid();
  drawRoute();
}
void drawRoute(){
  stroke(0,0,255);
  strokeWeight(5);
  noFill();
  int i=endX, j=endY;
  int oldI=i, oldJ=j;
  while(true){
    oldI=i; oldJ=j;
    i=fromI[oldI][oldJ];
    j=fromJ[oldI][oldJ];
    rect(20*i, 20*j, 20,20);
    if(i==startX && j==startY)break;
  }
}
void drawGrid(){
  stroke(0);
  strokeWeight(1);
  for(int i=0;i<10;i++){
    for(int j=0;j<10;j++){
      if(grid[i][j]==-1) fill(255);
      else if(grid[i][j]==-2) fill(0);
      else if(grid[i][j]==0) fill(255,0,0);
      else if(grid[i][j]==999) fill(0,255,0);
      else fill(230);
      rect(i*20,j*20,20,20);
      fill(0);
      text(""+grid[i][j], i*20+5,j*20+20-5);
    }
  }
}
void mouseModify(){
  int i=mouseX/20;
  int j=mouseY/20;
  if(i>=10 || j>=10) return ;
  if(mouseButton==LEFT) grid[i][j]=-2;
  else if(mouseButton==RIGHT) grid[i][j]=-1;
}
void mousePressed(){
  mouseModify();
}
void mouseDragged(){
  mouseModify();
}
void clearRoute(){
  for(int i=0;i<10;i++){
    for(int j=0;j<10;j++){
      if(grid[i][j]>0) grid[i][j]=-1;
    }
  }
}
void keyPressed(){
  if(key==' '){
    clearRoute();
    solve(startX, startY);
  }
}
void push(int i0, int j0, int i,int j, int level){
  grid[i][j]=level;
  queue.offer(i);
  queue.offer(j);
  queue.offer(level);
  fromI[i][j]=i0;
  fromJ[i][j]=j0;
}
void solve(int i0, int j0){
  push(i0,j0,i0,j0,0);
  while(queue.size()>0){
    int i=(Integer) queue.pop();
    int j=(Integer) queue.pop();
    int level=(Integer) queue.pop();
    if(valid(i+1,j)) push(i,j,i+1,j, level+1);
    if(valid(i,j+1)) push(i,j,i,j+1, level+1);
    if(valid(i-1,j)) push(i,j,i-1,j, level+1);
    if(valid(i,j-1)) push(i,j,i,j-1, level+1);
  }
  grid[endX][endY]=999;
}
boolean valid(int i,int j){
  if(i<0 || j<0 || i>=10 || j>=10) return false;
  else if(grid[i][j]==-1) return true;
  else return false;
}

