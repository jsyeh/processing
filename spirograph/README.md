

# Spirograph 萬花尺

我在 FB 看到廣告影片, Weicskgl2 在賣萬花尺。
- [FB影片](https://www.facebook.com/watch/?v=274789904222202) 廣告詞: 🎨 這是一個幾乎被遺忘的童年玩具 🌟有利於培養孩子的動手能力 ✨ 開發智力和思維能力🎁🎁 立即获取👉https://bit.ly/3smHtiO [賣場](https://tw.weicskgl.com/detail1?id=542)
- [露天spirograph](https://www.ruten.com.tw/find/?q=spirograph)
- [蝦皮spirograph](https://shopee.tw/search?keyword=spirograph)
- [蝦皮有賣家96元](https://shopee.tw/27Pcs-Kids%E5%8E%9F%E8%A3%9DSpirograph%E8%A8%AD%E8%A8%88%E5%9C%96%E7%B4%99%E9%8C%AB%E7%B9%AA%E8%A3%BD%E8%97%9D%E8%A1%93%E5%B7%A5%E8%97%9D%E7%8E%A9%E5%85%B7-KT%E6%AF%8D%E5%AC%B0-i.77521276.4565438982)

雖然看起來像詐騙風格的一頁式網頁, 不過我覺得這個玩具很好玩。會想要寫程式畫畫看。

我之前實作到一半就分心, 因為看到後面漸的色彩, 我反而去找背景圖, 這樣就不行了。現在我打算用線條的方式, 慢慢畫出來。
要漸層背景的話, 可找 rainbow scratch paper 刮畫紙。

https://en.wikipedia.org/wiki/Spirograph

按下圖可播放影片

[![Spirograph](https://j.gifs.com/mOLWg9.gif)](https://youtu.be/9_6XOOiyvkA)

程式實作的過程記錄
===============
我的程式記錄 [hackmd](https://hackmd.io/@jsyeh/spirograph)

Step01 先畫出大圓
---------------
先畫出簡單的大圓, 風格使用黑底、白線條, 希望像影片中的風格。
```Processing
void setup(){
  size(500,500);
  stroke(255);
  noFill();
}
void draw(){
  background(0);
  ellipse(250,250, 450,450);
}
```

Step02 mouse畫出小園
-------------------
接著用 mouse 來移動小圓。利用手來輔肋, 放好小圓後, 比較容易做出輔助線, 了解小圓是怎麼移動的。
```Processing
void setup(){
  size(500,500);
  stroke(255);
  noFill();
}
void draw(){
  background(0);
  ellipse(250,250, 450,450);
  ellipse(mouseX, mouseY, 100,100);
}
```

Step03 atan2() 算小圓圓心
--------------------------
利用 mouse 及 atan2() 算出角度, 推算出小圓圓心後
```Processing
void setup(){
  size(500,500);
  stroke(255);
  noFill();
}
void draw(){
  background(0);
  ellipse(250,250, 450,450);
  float angle=atan2(mouseY-250,mouseX-250);
  float x=250+175*cos(angle), y=250+175*sin(angle);
  line(250,250, x, y);
  ellipse(x,y, 100, 100);
}
```

Step04 用變數取代數值
----------------------
用變數取代數值。之後只要改變大圓半徑、小圓半徑, 就有機會畫出不同的線條。
```Processing
void setup(){
  size(500,500);
  stroke(255);
  noFill();
}
float r0=225, r1=50;
float cx=250, cy=250;
void draw(){
  background(0);
  ellipse(cx,cy, r0*2, r0*2);
  float angle=atan2(mouseY-cy,mouseX-cx);
  float x=cx+(r0-r1)*cos(angle), y=cy+(r0-r1)*sin(angle);
  line(cx,cy, x, y);
  ellipse(x,y, r1*2, r1*2);
}
```

Step05 小圓會旋轉
----------------
為了讓小圓有旋轉的效果, 所以新增 circle2()函式, 裡面有angle參數, 可以調整旋轉角度。現階段先隨便用個值來旋轉。之後應該算出合理的值來旋轉。
註: 為了看到旋轉的效果, 小圓有附幾條輪輻, 小圓輪輻數少,轉動較清楚。
```Processing
void setup(){
  size(500,500);
  stroke(255);
  noFill();
}
float r0=225, r1=50;
float cx=250, cy=250;
void draw(){
  background(0);
  ellipse(cx,cy, r0*2, r0*2);
  float angle=atan2(mouseY-cy,mouseX-cx);
  float x=cx+(r0-r1)*cos(angle), y=cy+(r0-r1)*sin(angle);
  line(cx,cy, x, y);
  circle2(x,y, r1, mouseX);//ellipse(x,y, r1*2, r1*2);
}
void circle2(float cx, float cy, float r, float angle){
  ellipse(cx,cy, r*2, r*2);
  for(float a=angle; a<angle+PI*2;a+=PI/4){
    line(cx,cy, cx+r*cos(a), cy+r*sin(a));
  }
}
```

Step06 計算正確角度
-----------------
要利用大小齒輪的比例關係, 從大圓的 angle 算出小園的旋轉角度。因為圓周與半徑成正比, 所以直接照比例給角度即可。
```Processing
void setup(){
  size(500,500);
  stroke(255);
  noFill();
}
float r0=225, r1=50;
float cx=250, cy=250;
void draw(){
  background(0);
  ellipse(cx,cy, r0*2, r0*2);
  float angle=atan2(mouseY-cy,mouseX-cx);
  float angle2= -angle * r0 / r1;
  float x=cx+(r0-r1)*cos(angle), y=cy+(r0-r1)*sin(angle);
  line(cx,cy, x, y);
  circle2(x,y, r1, angle2);
}
void circle2(float cx, float cy, float r, float angle){
  ellipse(cx,cy, r*2, r*2);
  for(float a=angle; a<angle+PI*2;a+=PI/4){
    line(cx,cy, cx+r*cos(a), cy+r*sin(a));
  }
}
```

Step07 畫出小圓孔動的軌跡
----------------------
其實可以利用相似的「大圓、小圓」關係, 讓小圓裡的孔洞視為更小的半徑的小小圓, 來畫出來畫出線條。這裡先利用ArrayList, 來存點的座標, 並畫出對應的曲線。

Bug: 不過因為 atan2() 有範圍, 超過的角度, 就沒辦法畫出來。
```Processing
ArrayList<PVector> points;
void setup(){
  size(500,500);
  stroke(255);
  noFill();
  points = new ArrayList<PVector>();
}
float r0=225, r1=50, r2=37;
float cx=250, cy=250;
void draw(){
  background(0);
  ellipse(cx,cy, r0*2, r0*2);
  beginShape();
  for( PVector pt : points ){
    vertex(pt.x, pt.y);//之後可變彩色漸層色彩
  }
  endShape();
  float angle=atan2(mouseY-cy,mouseX-cx);
  float angle2= -angle * r0 / r1;
  float x=cx+(r0-r1)*cos(angle), y=cy+(r0-r1)*sin(angle);
  line(cx,cy, x, y);
  circle2(x,y, r1, angle2);
}
void circle2(float cx, float cy, float r, float angle){
  ellipse(cx,cy, r*2, r*2);
  for(float a=angle; a<angle+PI*2;a+=PI/4){
    line(cx,cy, cx+r*cos(a), cy+r*sin(a));
  }
}
void mouseDragged(){//按下mouse才開始記錄點
  float angle=atan2(mouseY-cy,mouseX-cx);
  float angle2= -angle * r0 / r1;
  float x=cx+(r0-r1)*cos(angle), y=cy+(r0-r1)*sin(angle);  
  float x2=x+r2*cos(angle2), y2=y+r2*sin(angle2); 
  points.add( new PVector(x2,y2) );
}
```

Step08 讓角度沒範圍限制
--------------------
因前一版的程式使用 atan2() 讓角度有問題。所以其實可以利用 "角度遞增" 的方式, 來修改 angle 角度。 (mouseX,mouseY) vs. (pmouseX,pmouseY) 會有夾角, 拿這個夾角來計算。
注意: 不能 angleNow - angle, 要 angleNow-angleOld才行。因為這樣才是2個 -PI~+PI 的數字相比較, 才會正確。

不過這個版本會有1個Bug: mouse動太快時, points 加得不夠密, 會有漏點的直線出現。
可能需要以夠細的角度為準, 內插出更多的角度,來推算出點。 (這個也算是 feature, 因為一定會有人想要畫得很快, 就讓他們看到畫面失敗的線條吧) 
TODO: 真的點太多時, memeory也會用盡, 需要提供警告, 並將 memory 清空
TODO: 每次 mousePressed時, 應該是新的線段。每次 mouseReleased時, 就結束線段。
TODO: 畫圖前/畫圖中, 可提供「換齒輪」的功能。

```Processing
ArrayList<PVector> points;
void setup(){
  size(500,500);
  stroke(255);
  noFill();
  points = new ArrayList<PVector>();
  angle = atan2(-cy, -cx);//一開始mouseX,mouseY為0,所以角度向左上角
}//之後可引導 mousePressed 在小齒輪後, 才能開始控制轉動
float r0=225, r1=50, r2=37;
float cx=250, cy=250;
float angle;
void draw(){
  background(0);
  ellipse(cx,cy, r0*2, r0*2);
  beginShape();
  for( PVector pt : points ){
    vertex(pt.x, pt.y);//之後可變彩色漸層色彩
  }
  endShape();
  float delta = deltaAngle();
  angle += delta;
  println(angle, delta);
  //float angle=atan2(mouseY-cy,mouseX-cx);
  float angle2= -angle * r0 / r1;
  float x=cx+(r0-r1)*cos(angle), y=cy+(r0-r1)*sin(angle);
  line(cx,cy, x, y);
  circle2(x,y, r1, angle2);
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
  //不能 angleNow - angle, 要 angleNow-angleOld才行
  float delta = angleNow - angleOld;
  if( abs(delta)> PI ){
    if(delta>0) delta-=PI*2;
    else delta += PI*2;
  }
  return delta;
}
void mouseDragged(){//按下mouse才開始記錄點
  //float angle=atan2(mouseY-cy,mouseX-cx);
  float angle2= -angle * r0 / r1;
  float x=cx+(r0-r1)*cos(angle), y=cy+(r0-r1)*sin(angle);  
  float x2=x+r2*cos(angle2), y2=y+r2*sin(angle2); 
  points.add( new PVector(x2,y2) );
}
```

Step09 彩色的線條
---------------
目前做出彩色的線條, 為了錄影 saveFrame() 所以改成 640x480 的解析度。不過有些可改進的地方:
- 可以用其他解析度 (ex. IG 的正方型, FB的長方形) 方便分享影片
- 畫出來的線有點粗, 可能是解析度 640x480 不夠高
- Processing 用 2010 QuickTime Movie Maker 做出來的 mov 檔, 無法在 Windows 電影與電視播放(無法播放: 此項目的編碼格式是不支援的格式。0xc00d5212)。 使用 Messenger 也無法傳送。我目前是先在 FB貼文後, 再下載 mp4 檔。
- Can't play: This item was encoded in a format that's not supported. 0xc00d5212

[![Spirograph](https://j.gifs.com/6XrAw7.gif)](https://youtu.be/ELrkairuidA)

```Processing
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
```

Step10 準備可刮花的背景圖
----------------------
在記錄線條時, 要用很長的陣列來畫線, 好像有點麻煩。為了讓線條有漸層的色彩, 或許可改用刮畫的方式來做, 也就是黑色背景被刮掉後, 便會秀出藏在後面的漸層背景圖。
這個版本先把圓變細、曲線變粗、把背景換圖。之後再想怎麼在蓋上可刮花的mask。
```Processing
PImage imgBG;
//https://gentlejourneysbirthing.com/home/colorful_watercolor_texture_by_connyduck-d6o409f/
ArrayList<PVector> points;
void setup(){
  size(800,600,P2D);
  imgBG=loadImage("watercolor_texture.png");
  stroke(255);
  noFill();
  points = new ArrayList<PVector>();
  angle = atan2(-cy, -cx);//一開始mouseX,mouseY為0,所以角度向左上角
}//之後可引導 mousePressed 在小齒輪後, 才能開始控制轉動
float r0=225, r1=57, r2=37.3;
float cx=320, cy=240;
float angle;
void draw(){
  background(imgBG);
  colorMode(RGB);
  stroke(255);
  strokeWeight(1);
  ellipse(cx,cy, r0*2, r0*2);
  angle += deltaAngle();
  float angle2= -angle * r0 / r1;
  float x=cx+(r0-r1)*cos(angle), y=cy+(r0-r1)*sin(angle);
  //line(cx,cy, x, y);//不要畫線,比較好看
  circle2(x,y, r1, angle2);
  colorMode(HSB);
  float H=0;
  strokeWeight(3);
  beginShape();
  for( PVector pt : points ){
    stroke( H, 255,255);
    vertex(pt.x, pt.y);//之後可變彩色漸層色彩
    H+=1;
    if(H>255) H-=255;
  }
  endShape();
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
```

Step11 練習刮畫
---------------
我先寫個簡單的程式, 可以在黑色背景上, 放有刮痕的彩色圖, 看起來的效果,像是刮畫。
```Processing
PImage imgBG;
PGraphics pg;
void setup(){
  size(800,600);
  imgBG=loadImage("watercolor_texture.png");
  pg = createGraphics(800,600);
  pg.beginDraw();
  pg.noFill();
  pg.strokeWeight(10);
  pg.stroke(255);
  pg.ellipse(400,300,300,300);
  pg.endDraw();
}
void draw(){
  background(0);
  imgBG.mask(pg);
  image(imgBG,0,0);
}
```

接著, 便能將程式改版出來了。
[![Spirograph](https://j.gifs.com/lxKWVj.gif)][https://user-images.githubusercontent.com/3252557/112619853-c18b4080-8e62-11eb-9f74-ff68881f5c5f.mp4]

```Processing
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
```
