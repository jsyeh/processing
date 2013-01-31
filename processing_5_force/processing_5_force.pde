float angle[] = {90*PI/180, 162*PI/180, 234*PI/180, 306*PI/180, 18*PI/180};
float x(int a, float len){
  return 300+200*cos(angle[a%5])*len;  
}
float y(int a, float len){
  return 300-200*sin(angle[a%5])*len;
}
void setup(){
  size(600,600);
}
void draw(){
  stroke(0);
  //draw standard 5-edge polygon
  for(int i=0;i<5;i++)
    for(float j=1;j>0;j-=0.2)
      line(x(i,j),y(i,j),x(i+1,j),y(i+1,j));
  //draw 5 lines from center
  for(int i=0;i<5;i++){
     line(x(i,0),y(i,0),x(i,1),y(i,1));
  }
  //draw the 5-attributes for somebody
  stroke(255,0,0);
  float r[] = {0.5, 0.7, 0.2, 0.3, 0.3, 0.5};
  for(int i=0;i<5;i++){
    line(x(i,r[i]),y(i,r[i]),x(i+1,r[i+1]),y(i+1,r[i+1]));
  }
}
