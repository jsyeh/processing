ArrayList<PVector> points;
void setup(){
  size(640,480,P2D);
  stroke(255);
  noFill();
  points = new ArrayList<PVector>();
  angle = atan2(-cy, -cx);//一開始mouseX,mouseY為0,所以角度向左上角
}//之後可引導 mousePressed 在小齒輪後, 才能開始控制轉動
float r0=225, r1=57, r2=37.3;
float cx=320, cy=240;
float angle;
void draw(){
  background(0);
  ellipse(cx,cy, r0*2, r0*2);
  colorMode(HSB);
  float H=0;
  beginShape();
  for( PVector pt : points ){
    stroke( H, 255,255);
    vertex(pt.x, pt.y);//之後可變彩色漸層色彩
    H+=1;
    if(H>255) H-=255;
  }
  endShape();
  colorMode(RGB);
  stroke(255);
  angle += deltaAngle();
  float angle2= -angle * r0 / r1;
  float x=cx+(r0-r1)*cos(angle), y=cy+(r0-r1)*sin(angle);
  line(cx,cy, x, y);
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
}
