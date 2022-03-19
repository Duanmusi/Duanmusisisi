Trs[]trs=new Trs[100];
int[]colors={#f5ad92,#ed717f,#c67486,#765e8d,#00577f};
float toumingdu;

import ddf.minim.*;
Minim   minim;
AudioPlayer music;
float voice;

void setup(){
  fullScreen();
  frameRate(80);
  for(int i=0;i<trs.length;i++){
    trs[i]=new Trs(random(width),random(height),random(10,50));
  }
  
   minim=new Minim(this);
   music=minim.loadFile("music.mp3",1024);
   music.loop();
  
}

void draw(){
  
  voice=music.mix.level();
  
  toumingdu=map(mouseX,0,width,255,0);
  noStroke();
  fill(255,toumingdu);
  rect(0,0,width,height);
  
  for(int i=0;i<trs.length;i++){
    trs[i].update();
    trs[i].display();
    trs[i].sizechange();
    trs[i].check();
//    trs[i].connect();
  }
}

class Trs{
  
   float x1,y1,x2,y2,x3,y3,x,y;
   float angle,aspeed;
   float vx,vy;
   float r;
   int c;
   
   Trs(float x,float y,float r){
     this.x=x;
     this.y=y;
     this.r=r;
     angle=random(360);
     aspeed=random(1)>0.5?random(-4,-0.2):random(0.2,4);
     vx=random(1)>0.5?random(-2,-0.1):random(0.1,2);
     vy=random(1)>0.5?random(-2,-0.1):random(0.1,2);
     c=(int)random(colors.length);
   }
   
   void update(){
     x+=vx;
     y+=vy;
     angle+=aspeed;
     x1=x+r*cos(radians(angle));
     x2=x+r*cos(radians(angle+120));
     x3=x+r*cos(radians(angle+240));
     y1=y+r*sin(radians(angle));
     y2=y+r*sin(radians(angle+120));
     y3=y+r*sin(radians(angle+240));
   }
   
   void sizechange(){
     r=20+voice*400;
   }
   
   void display(){
     noStroke();
     fill(colors[c]);
     triangle(x1,y1,x2,y2,x3,y3);
   }
   
   void check(){
     if(x>width) vx*=-1;
     if(x<0) vx*=-1;
     if(y>height) vy*=-1;
     if(y<0) vy*=-1;
   }
   
//   void connect(){
//     for(int i=0;i<trs.length;i++){
//       for(int j=i;j<trs.length;j++){
//        strokeWeight(1);
//         stroke(colors[c]);
//         if(dist(trs[i].x1,trs[i].y1,trs[j].x1,trs[j].y1)<100)
//           line(trs[i].x1,trs[i].y1,trs[j].x1,trs[j].y1);
//         if(dist(trs[i].x2,trs[i].y2,trs[j].x2,trs[j].y2)<100)
//           line(trs[i].x2,trs[i].y2,trs[j].x2,trs[j].y2);
//         if(dist(trs[i].x3,trs[i].y3,trs[j].x3,trs[j].y3)<100)
//           line(trs[i].x3,trs[i].y3,trs[j].x3,trs[j].y3);
//       }
//     }
//   }
  
}
