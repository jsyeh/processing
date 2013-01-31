PImage taskman,princess,bar,bg;
void setup(){
  size(1024,768);
  taskman=loadImage("taskman.png");
  //princess=loadImage("cinderella2.gif");
  princess=loadImage("cinderella-clip-art-4.gif");
  bar=loadImage("taskbar.png");
  bg=loadImage("bg.png");
  background(bg);

  float oldty=0,dy=4;
  float cx=mouseX-taskman.width/2,cy=mouseY-taskman.height/2;
  for(float a=0;a<3.25;a+=0.02){
    image(bar,0,768-bar.height);
    float tx=(1+sin(a+PI)*sin(a+PI)*sin(a+PI))*(1024-taskman.width+a*30)*0.7+70;
    float ty=oldty+dy;
    oldty=ty;
    if(ty<0 && ty>768)dy=-dy;
    image(taskman,tx,ty);
  }
  loadPixels();
}

void keyPressed(){
  if(key=='s'){
    save("cinderella_desktop.png");
  }
}

void draw(){
  float w2=princess.width/2, h2=princess.height/2;
  updatePixels();
  image(princess,mouseX-w2/2,mouseY-h2/2,w2,h2);
}

