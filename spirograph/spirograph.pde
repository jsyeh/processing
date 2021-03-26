PImage imgBG;
PGraphics pg;
//https://gentlejourneysbirthing.com/home/colorful_watercolor_texture_by_connyduck-d6o409f/
ArrayList<PVector> points;
void setup(){
  size(800,600,P2D);  
  stroke(255);
  noFill();
  points = new ArrayList<PVector>();
  angle = atan2(-cy, -cx);//一開始mouseX,mouseY為0,所以角度向左上角
  imgBG=loadImage("watercolor_texture.png");
  pg = createGraphics(800,600);
  drawPG();
}//之後可引導 mousePressed 在小齒輪後, 才能開始控制轉動
float r0=225, r1=57, r2=37.3;
float cx=320, cy=240;
float angle;
void drawPG(){
  pg.beginDraw();
  pg.noFill();
  pg.strokeWeight(2);
  pg.stroke(255);
  pg.beginShape();
  int a = points.size();
  if(a>2){
    pg.vertex(points.get(a-2).x, points.get(a-2).y);
    pg.vertex(points.get(a-1).x, points.get(a-1).y);
  }//只畫最後的點,前面不用再畫,可能會快一點
/*  for( PVector pt : points ){
    pg.vertex(pt.x, pt.y);//之後可變彩色漸層色彩
  }*/
  pg.endShape();
  pg.endDraw();
}
void draw(){
  background(0);
  imgBG.mask(pg);
  image(imgBG,0,0);
  colorMode(RGB);
  stroke(128);
  strokeWeight(1);
  ellipse(cx,cy, r0*2, r0*2);
  angle += deltaAngle();
  float angle2= -angle * r0 / r1;
  float x=cx+(r0-r1)*cos(angle), y=cy+(r0-r1)*sin(angle);
  //line(cx,cy, x, y);//不要畫線,比較好看
  circle2(x,y, r1, angle2);
  //if(mousePressed) saveFrame();
}
void circle2(float cx, float cy, float r, float angle){
  ellipse(cx,cy, r*2, r*2);
  for(float a=angle; a<angle+PI*2;a+=PI/4){
    line(cx,cy, cx+r*cos(a), cy+r*sin(a));
  }
}
float deltaAngle(){
  float angleNow=atan2(mouseY-cy,mouseX-cx);
  float angleOld=atan2(pmouseY-cy,pmouseX-cx);
  float delta = angleNow - angleOld;
  if( abs(delta)> PI ){
    if(delta>0) delta-=PI*2;
    else delta += PI*2;
  }
  return delta;
}
void mouseDragged(){//按下mouse才開始記錄點
  float angle2= -angle * r0 / r1;
  float x=cx+(r0-r1)*cos(angle), y=cy+(r0-r1)*sin(angle);  
  float x2=x+r2*cos(angle2), y2=y+r2*sin(angle2); 
  points.add( new PVector(x2,y2) );
  drawPG();
}
