int m = 5000;
PImage [] img = new PImage [14];
void setup(){
  size(399, 700);
  fill(191, 30, 46);
  rect(0, 0, 399, 133);
  rect(0, 266, 399, 515);
  for (int i=0; i < 5; i++) img[i] = loadImage("pokemonicon" +i + ".png");
  img [5] = loadImage("a.png");
  img [6] = loadImage("coin50b.png");
  img [7] = loadImage("b.png");
  img [8] = loadImage("o1.png");
  img [9] = loadImage("o2.png");
  img [10] = loadImage("M.jpg");
  img [11] = loadImage("jpot.png");
}
int index[]={0,0,0}, Y[]={0,0,0}, VY[]={0,0,0};//0,1,2,3,4
int stop=0, start=0, win=0;//start 0:noShow, 1:show, 2: showStop  
void draw(){
  for(int i=0;i<3;i++){
    image(img[ (index[i])%5 ], i*133, 133+Y[i]);
    image(img[ (index[i]+1)%5 ], i*133, 133-133+Y[i]);
    Y[i] += VY[i];
    if(Y[i]>=133-1){
      index[i]++;
      Y[i]=0;
    }
    if(stop==1 && Y[i]==0 && VY[i]>0){
      VY[i]--;
    }
  }
  if(stop==1 && VY[0]==0 && VY[1]==0 & VY[2]==0 && index[0]==index[1] && index[1]==index[2]){
    win = 5000;
    stop=0;
  }
  if(win>0){
    m+=100;
    win -=100;
  }
  noStroke();
  rect(0, 0, 399, 133);
  rect(0, 266, 399, 200);
  image(img[8], 102.5, 0);
  image(img[9], 44, 48);
  image(img[6], 0, 325);
  image(img[6], 133, 325);
  image(img[6], 266, 325);
  fill(0, 255, 255);
  textSize(50);
  text("X1", 26.5, 478);
  text("X2", 159.5, 478);
  text("X10", 282.5, 478);
  text("$"+m, 120, 320);
  fill(191, 30, 46);
  if(start==1) image(img[5],0,500);
  else if(start==2){
    rect(0,500,399,200);
    image(img[10],0,480);
    image(img[7],200,500);
  }
  println(VY);
}
void keyPressed(){
  if(key=='1') VY[0]+=2;
  if(key=='2') VY[1]+=2;
  if(key=='3') VY[2]+=2;
  if(key==' ') stop=1;
}
void mousePressed(){
  float r=133/2;
  if( dist(mouseX, mouseY, 0+r,325+r)<r ){
    m-=50; start=1;
  }else if(dist(mouseX, mouseY, 133+r, 325+4)<r){
    m-=100; start=1;
  }else if(dist(mouseX, mouseY, 266+r, 325+4)<r){
    m-=500; start=1;
  }
  if(start==1 && dist(mouseX, mouseY, 0+r,480+r)<r){
    VY[0]=int(random(3,5))*3;
    VY[1]=int(random(3,5))*3;
    VY[2]=int(random(3,5))*3;
    start=2;//0:noShow, 1:show, 2: showStop  
    stop=0;
  }
  if(start==2 && dist(mouseX, mouseY, 200+r,500+r)<r){
    stop=1;
  }
}