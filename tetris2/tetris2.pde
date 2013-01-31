//Tetris
int W=10,H=20,S=30;
int [][]grid=new int[W][H];
int shapeX=W/2,shapeY=0;
int AW=4,AH=4;
int [][]table={{1,0,0,0},{1,0,0,0},{1,0,0,0},{1,0,0,0}};
int [][][] table2=new int[4][4][4];
class block{
  int x,y;
  int [][]table = {{1,0,0,0},{1,0,0,0},{1,0,0,0},{1,0,0,0}};
  block(){
    
  }
  void draw(){
    
  }
}
void setup(){
  size(S*W,S*H);
  setRotate();
}
void draw(){
  background(0);
  drawExisted();
  drawAvatar();
}
void drawExisted(){
  fill(255,0,0);
  for(int i=0;i<W;i++){
    for(int j=0;j<H;j++){
      if(grid[i][j]==1) rect(i*S,j*S,S,S);
    }
  }
}
void drawAvatar(){
  for(int i=0;i<AW;i++){
    for(int j=0;j<AH;j++){
      if(table[i][j]==1) rect((i+shapeX)*S,(j+shapeY)*S,S,S);
    }
  }
}
void setRotate(){
  table2[0]=table;
  
}
void keyPressed(){
  if(key==CODED && keyCode==RIGHT){
    shapeX++;
  }else if(key==CODED && keyCode==LEFT){
    shapeX--;
  }
}
