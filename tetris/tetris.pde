int W=10,H=20;
int [][]grid=new int[W][H];
color [] c={color(255,0,0), color(0,255,0), color(0,0,255)};
int nowX=5,nowY=0;
int life=millis();
void setup(){
  for(int i=0;i<W;i++)
    for(int j=0;j<H;j++)
      grid[i][j]=-1;
  size(20*W,20*H);
  stroke(255,255,255);
}
void draw(){
  background(0,0,0);
  for(int i=0;i<W;i++){
    for(int j=0;j<H;j++){
      int g=grid[i][j];
      if(g==-1)continue;
      fill(c[g]);
      rect(i*20,j*20,20,20);
    }
  }
  if(millis()-life>1000){
    life=millis();
    nowY++;
    if(nowY>=H)nowY=H-1;
  }
  fill(c[0]);
//  rect(nowX*20,nowY*20,20,20);
  shapeL(nowX,nowY);
}
void mousePressed(){
  grid[mouseX/20][mouseY/20]=0;
}
void keyPressed(){
  if(key==CODED && keyCode==LEFT){
    nowX--;
    if(nowX<0)nowX=0;
  }else if(key==CODED && keyCode==RIGHT){
    nowX++;
    if(nowX>=W)nowX=W-1;
  }else if(key==CODED && keyCode==DOWN){
    nowY++;
    if(nowY>=H)nowY=H-1;
  }
}
void shapeL(int x, int y){
  int []code={0,1,0,0, 0,1,0,0, 0,1,1,0, 0,0,0,0};
  fill(c[0]);
  for(int i=0;i<16;i++){
    if(code[i]==1){
      int x2=x+i%4, y2=y+i/4;
      rect(x2*20,y2*20,20,20);
    }
  }
}
