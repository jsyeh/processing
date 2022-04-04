//想要做出C學習繪本的盒子效果
//https://jese-infini.com/2016/02/21/印刷第四課：印前基礎-網點/
//google: css 3d cube generator
//https://3dtransforms.desandro.com/cube
//https://html-online.com/articles/css3-cube/
//http://apps.eky.hk/css-triangle-generator/zh-hant
void setup(){
  size(500,400,P3D);
  //fill( CMYKtoRGB(0,100,0,10) );
  fill(165,124,140);
  fill(#D8A4B9);
  strokeWeight(3);
  lights();
}
void draw(){
  background(255);
  ortho();
  translate(width/2,height/2);
  rotateX(radians(-30));
  rotateY(radians(30));
  
  for(int i=0; i<3; i++){
    for(int j=0; j<3; j++){
      myBox(i,j);      
    }
  }
}
void myBox(int i, int j){
  float boxSize=100;
  pushMatrix();
    scale(1,0.5,0.75);
    translate(i*boxSize,0,-j*boxSize);
    //box(boxSize);
    myBox(boxSize);
  popMatrix();  
}
void myBox(float boxSize){
  
  strokeWeight(4);
  noFill(); box(boxSize);
  float s=boxSize*0.499;

  fill(#D8A4B9);//亮85%
  beginShape(QUAD);
  vertex(-s, -s, +s);
  vertex(-s, +s, +s);
  vertex(+s, +s, +s);
  vertex(+s, -s, +s);
  endShape();

  beginShape(QUAD);
  vertex(-s, -s, -s);
  vertex(-s, +s, -s);
  vertex(-s, +s, +s);
  vertex(-s, -s, +s);
  endShape();
  
  fill(#A57D8D);//暗64%
  beginShape(QUAD);
  vertex(+s, -s, -s);
  vertex(+s, +s, -s);
  vertex(+s, +s, +s);
  vertex(+s, -s, +s);
  endShape();
  
  fill(#8B6977);//暗暗54%
  beginShape(QUAD);
  vertex(-s, -s, -s);
  vertex(-s, +s, -s);
  vertex(+s, +s, -s);
  vertex(+s, -s, -s);
  endShape();
}
color CMYKtoRGB(float Cyan, float Magenta, float Yellow, float Black){
  //但是色彩調出來好像有點太亮 https://www.ginifab.com/feeds/pms/cmyk_to_rgb.php
  float Red = 255 * ( 1 - Cyan / 100 ) * ( 1 - Black / 100 );
  float Green = 255 * ( 1 - Magenta / 100 ) * ( 1 - Black / 100 );
  float Blue = 255 * ( 1 - Yellow / 100 ) * ( 1 - Black / 100 );
  return color(Red, Green, Blue);
}
