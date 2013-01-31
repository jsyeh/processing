int turn=1;
int count=0;
int whowin=0;
int [][] array = new int[3][3];
color [] myColor = new color[3];
int [][] rule= {{0,1,2},{3,4,5},{6,7,8},{0,3,6},{1,4,7},{2,5,8},{0,4,8},{2,4,6}};
int [][] value = new int[3][3];
void clear(int w,int h,int [][] array,int value){
  for(int i=0;i<w;i++){
    for(int j=0;j<h;j++){
      array[i][j]=value;
    }
  }
}
void setup(){
  size(700,600);
  clear(3,3,array,0);
  myColor[0]=color(203,203,203);
  myColor[1]=color(255,0,0);
  myColor[2]=color(0,0,0);
  turn=1;count=0;whowin=0;
}
void draw(){
  if(mouseX>600){
    setup();
  }else if(whowin>0){
    return;
  }

  background(203);
  for(int i=0;i<3;i++){
    for(int j=0;j<3;j++){
      fill(myColor[array[i][j]]);
      rect(i*200,j*200,200,200);
    }
  }
}
void win(int who){
  whowin=who;
  fill(myColor[who]);
  rect(0,0,600,600);
}
void decideWinLose(int who){
  for(int r=0;r<8;r++){
    int sum=0;
    for(int i=0;i<3;i++){
      if(array[rule[r][i]%3][rule[r][i]/3]==who) sum++;
    }
    if(sum==3){
      win(who);
      break;
    }
  }
}
void see(int i, int j){
  if(array[i][j]==0){
    array[i][j]=turn;
    decideWinLose(turn);

    turn=3-turn;
    count++;
  }
}
void mousePressed(){
  if(count>=9){ setup();return;}
  see(mouseX/200,mouseY/200);
  draw();
}
