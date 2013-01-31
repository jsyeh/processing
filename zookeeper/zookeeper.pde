int [][]board=new int[8][8];
PImage []animal = new PImage [7];
int [][]same=new int[8][8];
int selectI=0,selectJ=0;
int nowselect=0;
void init_board(){
  for(int i=0;i<8;i++){
    for(int j=0;j<8;j++){
      board[i][j] = int(random(7));
    }
  }
}
void check_col(){
  for(int i=0;i<8;i++){
    int old_animal=board[i][0];
    int old_animal_j=0;
    int count=1;
    for(int j=1;j<8;j++){
      if(board[i][j] == old_animal){
        count++;
      }else{//not the same
        if(count>=3){
          for(int c=0;c<count;c++){
            same[i][old_animal_j+c]=1;
          }
        }
        old_animal_j=j;
        old_animal=board[i][j];
        count=1;
      }
      if(count>=3){
        for(int c=0;c<count;c++){
          same[i][old_animal_j+c]=1;
        }
      }
    }
  }
}
void check_row(){
  for(int j=0;j<8;j++){
    int old_animal=board[0][j];
    int old_animal_i=0;
    int count=1;
    for(int i=1;i<8;i++){
      if(board[i][j] == old_animal){
        count++;
      }else{//not the same
        if(count>=3){
          for(int c=0;c<count;c++){
            same[old_animal_i+c][j]=1;
          }
        }
        old_animal_i=i;
        old_animal=board[i][j];
        count=1;
      }
      if(count>=3){
        for(int c=0;c<count;c++){
          same[old_animal_i+c][j]=1;
        }
      }
    }
  }
}
void check_same(){
  for(int i=0;i<8;i++){
    for(int j=0;j<8;j++){
      same[i][j]=0;
    }
  }
  check_col();
  check_row();
}
void setup(){
  size(500,400);
  for(int i=0;i<7;i++){
    animal[i]=loadImage(""+(i+1)+".bmp");
  }
  init_board();
}
void draw(){
  background(246,241,198);
  fill(251,255,232);
  for(int i=0;i<8;i++){
    for(int j=0;j<8;j++){
      if((i+j)%2==1){
        rect(i*50,j*50,50,50);
      }
      int nowanimal=board[i][j];
      if(same[i][j]==1){
        filter(INVERT);
        image( animal[nowanimal], i*50,j*50);
        filter(INVERT);
      }else{
        image( animal[nowanimal], i*50,j*50);
      }
    }
  }
  if(nowselect==1){
    int nowanimal=board[selectI][selectJ];
    filter(INVERT);
    image( animal[nowanimal], selectI*50,selectJ*50);
    filter(INVERT);
  }
  for(int i=0;i<7;i++){
    image(animal[i],420,i*20,20,20);
  }
  check_same();
}
void mousePressed(){
  int i=mouseX/50, j=mouseY/50;
  if(nowselect==0){
    nowselect=1;
    selectI=i;
    selectJ=j;
  }else{
    nowselect=0;
    int temp=board[i][j];
    if(i==selectI && abs(j-selectJ)==1){
      board[i][j]=board[selectI][selectJ];
      board[selectI][selectJ]=temp;
    }
     if(j==selectJ && abs(i-selectI)==1){
      board[i][j]=board[selectI][selectJ];
      board[selectI][selectJ]=temp;
    }
 }
}
