int [][]grid = new int[10][10];
void setup(){
  size(400,400);
  grid[4][4]=1;
  grid[4][5]=2;
  grid[5][4]=2;
  grid[5][5]=1;
}
void drawGrid(){
  for(int i=0;i<=10;i++){
    line(i*40,0,i*40,400);
    line(0,i*40,400,i*40);
  }  
}
void drawGo(){
  for(int i=0;i<10;i++){
    for(int j=0;j<10;j++){
      if(grid[i][j]==1){
        fill(255,0,0);
        ellipse(i*40+20,j*40+20, 40,40);
      }else if(grid[i][j]==2){
        fill(0,255,0);
        ellipse(i*40+20,j*40+20, 40,40);
      }
    }
  }
}
void draw(){
  background(255);
  drawGrid();
  drawGo();
}
int nowColor=1;
void mousePressed(){
  int i=mouseX/40, j=mouseY/40;
  if(grid[i][j]==0){
    grid[i][j]=nowColor;
    nowColor=3-nowColor;
    int sum=check8way(i,j);
  }
  println("This is the "+mouseX + " and " + mouseY);
}
int check1(int x, int y){
  //1-st to right
  for(int i=x+1;i<10;i++){
    if(grid[i][y]==0){//bad, no convert color and break;
      return 0;
    }else if(grid[i][y]==3-nowColor){
      for(int j=x+1;j<i;j++) grid[j][y]=3-nowColor;
      return i-x-1;
    }
  }
  return 0;
}
int check5(int x, int y){
  //2-st
  for(int i=x-1;i>=0;i--){
    if(grid[i][y]==0){//bad, no convert color and break;
      return 0;
    }else if(grid[i][y]==3-nowColor){
      for(int j=x-1;j>i;j--) grid[j][y]=3-nowColor;
      return x-1-i;
    }
  }  
  return 0;
}
int check3(int x, int y){
  for(int i=y+1;i<10;i++){
    if(grid[x][i]==0){
      return 0;
    }else if(grid[x][i]==3-nowColor){
      for(int j=y+1;j<i;j++) grid[x][j]=3-nowColor;
      return i-y-1;
    }
  }
  return 0;
}
int check7(int x, int y){
  for(int i=y-1;i>=0;i--){
    if(grid[x][i]==0){
      return 0;
    }else if(grid[x][i]==3-nowColor){
      for(int j=y-1;j>i;j--) grid[x][j]=3-nowColor;
      return y-1-i;
    }
  }
  return 0;
}
int check8way(int x, int y){
  int sum=0;
  sum+=check1(x,y);
  sum+=check3(x,y);
  sum+=check5(x,y);
  sum+=check7(x,y);
  return sum;
}
