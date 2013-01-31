PImage XmasTree;
int []snowx=new int[200];
int []snowy=new int[200];
int []speedx=new int[200];
int []speedy=new int[200];
void setup(){
  XmasTree = loadImage("snowman.png");
  size(640,480);
  for(int i=0;i<200;i++){
    snowx[i]=int(random(640));
    snowy[i]=int(random(480));
    speedx[i]=int(random(2))-1;
    speedy[i]=int(random(2))+1;
  }
  noStroke();
}
void draw(){
  image(XmasTree, 0,0,640,480);
  for(int i=0;i<200;i++){
    ellipse(snowx[i],snowy[i], 10,10);
    snowy[i]+=speedy[i];
    snowx[i]+=speedx[i]+int(random(3))-1;
    if(snowy[i]>480){
      snowy[i]=0;
      snowx[i]=int(random(640));
      speedx[i]=int(random(2))-1;
      speedy[i]=int(random(2))+1;
    }
  }
}  
