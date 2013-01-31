int turn=1;
int []computer={0,0};
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
  if(turn==2){
    ai(turn);
  }
  background(203);
  for(int i=0;i<3;i++){
    for(int j=0;j<3;j++){
      fill(myColor[array[i][j]]);
      rect(i*200,j*200,200,200);
    }
  }
}
void ai(int turn){
  int maxval=-1,maxi=0,maxj=0;
  clear(3,3,value,1);
  for(int r=0;r<8;r++){
    int []sum={0,0,0};
    for(int i=0;i<3;i++){
      int nowcolor=array[rule[r][i]%3][rule[r][i]/3];
      sum[nowcolor]++;
    }
    if(sum[turn]==2){//almost win
      for(int i=0;i<3;i++){
        int pos=rule[r][i];
        if(array[pos%3][pos/3]==0){
          //win!!!
          maxval=10000;
          maxi=pos%3;maxj=pos/3;
        }
      }
    }else if(sum[3-turn]==2){//almost lose
      for(int i=0;i<3;i++){
        int pos=rule[r][i];
        if(array[pos%3][pos/3]==0){
          //defense!
          maxval=5000;
          maxi=pos%3;maxj=pos/3;
        }
      }
    }else if(sum[0]>=2){
      for(int i=0;i<3;i++){
        int pos=rule[r][i];
        value[pos%3][pos/3]+=sum[0];//add weightr
      }
    }
  }
  for(int i=0;i<3;i++){
    for(int j=0;j<3;j++){
      if(array[i][j]==0 && maxval<value[i][j]){
        maxval=value[i][j];
        maxi=i;maxj=j;
      }
    }
  }
  see(maxi,maxj);
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
  if(mouseX>600 && mouseY<100){
    turn=2;//computer first
  }else if(mouseX>50 && mouseY<200){
    turn=1;//human first
  }
  if(mouseX<600){
    see(mouseX/200,mouseY/200);
  }
  draw();
}
