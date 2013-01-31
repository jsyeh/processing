float monsterX, monster2X, monster3X;
float bgX=0, bgY=0;
float startX=0;
PImage bg, monster;
void setup() {
  size(800, 600);
  monsterX=random(600);
  monster2X=random(600)+100;
  monster3X=random(600)+300;
  bg=loadImage("bg.png");
  monster=loadImage("monster.png");
}
void draw() {
  image(bg, bgX, bgY);
  image(bg, bgX+1200, bgY);
  if (bgX<-1200) {
    bgX+=1200;
  }

  image(monster, monsterX+startX, 500);
  if (monsterX+startX<-100) {
    monsterX +=800+ random(400);
  }
  image(monster, monster2X+startX, 500);
  if (monster2X+startX<-100) {
    monster2X +=800+ random(400);
  }
  image(monster, monster3X+startX, 500);
  if (monster3X+startX<-100) {
    monster3X +=800+ random(400);
  }
  println("startX:"+startX+" monsterX:"+monsterX);
}
void keyPressed() {
  if (key==CODED && keyCode==RIGHT) {
    bgX-=10;
    startX-=10;
  }
}

