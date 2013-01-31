int [][]grid = new int[10][10];
int []count=new int[3];
color c1=color(255,0,0), c2=color(0,255,0);
int nowColor=1;
void setup(){
  size(600,400);
  for(int i=0;i<10;i++){
    for(int j=0;j<10;j++){
      grid[i][j]=0;
    }
  }
  grid[4][4]=1;
  grid[4][5]=2;
  grid[5][4]=2;
  grid[5][5]=1;
  count[1]=2;
  count[2]=2;
  nowColor=1;
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
        fill(c1);
        ellipse(i*40+20,j*40+20, 40,40);
      }else if(grid[i][j]==2){
        fill(c2);
        ellipse(i*40+20,j*40+20, 40,40);
      }
    }
  }
}
void draw(){
  background(255);
  drawGrid();
  drawGo();
  fill(0);
  if(nowColor==1) rect(410,0,180,50);
  else rect(410,50,180,50);

  textSize(35);
  fill(c1);
  text("Count1:"+count[1],410,40);
  fill(c2);
  text("count2:"+count[2],410,90);
}
void mousePressed(){
  int i=mouseX/40, j=mouseY/40;
  if(grid[i][j]==0){
    int sum=check8way(i,j);
    if(sum>0){
      count[nowColor]+=sum+1;
      count[3-nowColor]-=sum;
      grid[i][j]=nowColor;
      nowColor=3-nowColor;
    }
  }
}
int check1(int x, int y){
  //1-st to right
  for(int i=x+1;i<10;i++){
    if(grid[i][y]==0){//bad, no convert color and break;
      return 0;
    }else if(grid[i][y]==nowColor){
      for(int j=x+1;j<i;j++) grid[j][y]=nowColor;
      return i-x-1;
    }
  }
  return 0;
}
int check3(int x, int y){
  for(int i=y+1;i<10;i++){
    if(grid[x][i]==0){
      return 0;
    }else if(grid[x][i]==nowColor){
      for(int j=y+1;j<i;j++) grid[x][j]=nowColor;
      return i-y-1;
    }
  }
  return 0;
}
int check5(int x, int y){
  //2-st
  for(int i=x-1;i>=0;i--){
    if(grid[i][y]==0){//bad, no convert color and break;
      return 0;
    }else if(grid[i][y]==nowColor){
      for(int j=x-1;j>i;j--) grid[j][y]=nowColor;
      return x-1-i;
    }
  }  
  return 0;
}
int check7(int x, int y){
  for(int i=y-1;i>=0;i--){
    if(grid[x][i]==0){
      return 0;
    }else if(grid[x][i]==nowColor){
      for(int j=y-1;j>i;j--) grid[x][j]=nowColor;
      return y-1-i;
    }
  }
  return 0;
}
int check2(int x, int y){
  for(int i=1;x+i<10 && y+i<10;i++){
    if(grid[x+i][y+i]==0){
      return 0;
    }else if(grid[x+i][y+i]==nowColor){
      for(int j=1;j<i;j++) grid[x+j][y+j]=nowColor;
      return i-1;
    }
  }
  return 0;
}
int check4(int x, int y){
  for(int i=1;x-i>=0 && y+i<10;i++){
    if(grid[x-i][y+i]==0){
      return 0;
    }else if(grid[x-i][y+i]==nowColor){
      for(int j=1;j<i;j++) grid[x-j][y+j]=nowColor;
      return i-1;
    }
  }
  return 0;
}
int check6(int x, int y){
  for(int i=1;x-i>=0 && y-i>=0;i++){
    if(grid[x-i][y-i]==0){
      return 0;
    }else if(grid[x-i][y-i]==nowColor){
      for(int j=1;j<i;j++) grid[x-j][y-j]=nowColor;
      return i-1;
    }
  }
  return 0;
}
int check8(int x, int y){
  for(int i=1;x+i<10 && y-i>=0;i++){
    if(grid[x+i][y-i]==0){
      return 0;
    }else if(grid[x+i][y-i]==nowColor){
      for(int j=1;j<i;j++) grid[x+j][y-j]=nowColor;
      return i-1;
    }
  }
  return 0;
}
int check8way(int x, int y){
  int sum=0;
  sum+=check1(x,y);
  sum+=check2(x,y);
  sum+=check3(x,y);
  sum+=check4(x,y);
  sum+=check5(x,y);
  sum+=check6(x,y);
  sum+=check7(x,y);
  sum+=check8(x,y);
  return sum;
}
