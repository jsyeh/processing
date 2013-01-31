import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class tictactao_ai_mullti_perfect extends PApplet {

int turn=1;
int count=0;
int whowin=0;
int []computer={0,0,0};
int [][] board = new int[3][3];
int [] myColor = new int[3];
int [][] rule= {{0,1,2},{3,4,5},{6,7,8},{0,3,6},{1,4,7},{2,5,8},{0,4,8},{2,4,6}};
int [][] value = new int[3][3];
public void clear(int w,int h,int [][] array,int data){
  for(int i=0;i<w;i++){
    for(int j=0;j<h;j++){
      array[i][j]=data;
    }
  }
}
public void setup(){
  size(800,600);
  clear(3,3,board,0);
  myColor[0]=color(203,203,203);
  myColor[1]=color(255,0,0);
  myColor[2]=color(0,0,0);
  turn=1;count=0;whowin=0;
  computer[1]=0;computer[2]=1;
}
public void draw(){
  background(203);
  for(int i=0;i<3;i++){
    for(int j=0;j<3;j++){
      fill(myColor[board[i][j]]);
      rect(i*200,j*200,200,200);
    }
  }
  fill(0);
  text("Human vs. A.I.",620,50);
  text("A.I. vs. Human", 620,150);
  text("Human vs. Human", 620,250);
  text("A.I. vs. A.I.", 620,350);
  if(whowin>0){
    fill(255,255,255,128);
    rect(0,0,600,600);
    return;
  }
  if(computer[turn]==1){
    ai(turn);
  }
}
public void ai(int turn){
  int maxval=-1,maxi=0,maxj=0;
  clear(3,3,value,1);
  for(int r=0;r<8;r++){
    int []sum={0,0,0};
    for(int i=0;i<3;i++){
      int nowcolor=board[rule[r][i]%3][rule[r][i]/3];
      sum[nowcolor]++;
    }
    if(sum[turn]==2){//almost win
      for(int i=0;i<3;i++){
        int pos=rule[r][i];
        if(board[pos%3][pos/3]==0){//go and win!!!
          maxval=10000;
          maxi=pos%3;maxj=pos/3;
        }
      }
    }else if(sum[3-turn]==2){ //almost lose
      for(int i=0;i<3;i++){
        int pos=rule[r][i];
        if(board[pos%3][pos/3]==0 && maxval<5000){//defense!  (add &&maxval<5000 to solve a bug!)
          maxval=5000;
          maxi=pos%3;maxj=pos/3;
        }
      }
    }else if(sum[0]>=2){
      for(int i=0;i<3;i++){
        int pos=rule[r][i];
        value[pos%3][pos/3]+=sum[0];//add weight
      }
    }
  }
  for(int i=0;i<3;i++){
    for(int j=0;j<3;j++){
      if(board[i][j]==0 && maxval<value[i][j]){
        maxval=value[i][j];
        maxi=i;maxj=j;
      }else if(board[i][j]==0 && maxval==value[i][j] && PApplet.parseInt(random(2))==1){
        maxval=value[i][j];
        maxi=i;maxj=j;
      }
    }
  }
  see(maxi,maxj);
}
public void decideWinLose(int who){
  for(int r=0;r<8;r++){
    int sum=0;
    for(int i=0;i<3;i++){
      if(board[rule[r][i]%3][rule[r][i]/3]==who) sum++;
    }
    if(sum==3){
      whowin=who;//game finish in draw-loop
      break;
    }
  }
}
public void see(int i, int j){
  if(board[i][j]==0){
    board[i][j]=turn;
    decideWinLose(turn);
    turn=3-turn;
    count++;
  }
}
public void mousePressed(){
  if(mouseX>600){setup();}
  if(mouseX>600 && mouseY<100){
    computer[1]=0;computer[2]=1;//human first
  }else if(mouseX>600 && mouseY<200){
    computer[1]=1;computer[2]=0;//computer first
  }else if(mouseX>600 && mouseY<300){
    computer[1]=0;computer[2]=0;//all human
  }else if(mouseX>600 && mouseY<400){
    computer[1]=1;computer[2]=1;//all computer
  }else if(mouseX<600 && whowin==0){
    see(mouseX/200,mouseY/200);
  }
  draw();
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#F0F0F0", "tictactao_ai_mullti_perfect" });
  }
}
