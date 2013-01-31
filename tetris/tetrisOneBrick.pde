int W=10,H=20;
int [][]grid=new int[W][H];
color [] c={color(255,0,0), color(0,255,0), color(0,0,255)};
int nowX=5,nowY=0;
int life=millis();
PImage img=loadImage("a.jpg");
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
}
void mousePressed(){
  grid[mouseX/20][mouseY/20]=0;
}
void keyPressed(){
  if(key==CODED && keyCode==LEFT){
    nowX--;
    if(nowX<0)nowX=0;
  }else if(key==CODED && keyCode==RIGHT){
    nowY++;
    if(nowX>=W)nowX=W-1;
  }
}
