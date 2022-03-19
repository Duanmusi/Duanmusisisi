Yuan[] yuans=new Yuan[20];

import ddf.minim.*;
Minim   minim;
AudioPlayer music;
float voice;

void setup(){
  size(500,500);
  for(int i=0;i<yuans.length;i++){
    yuans[i]=new Yuan(random(0,width),random(0,height),random(1,2));
  }
  frameRate(50);
  
   minim=new Minim(this);
   music=minim.loadFile("music.mp3",1024);
   music.loop();
  
}

void draw(){
  
  voice=music.mix.level();
  
  background(0);
  for(int i=0;i<yuans.length;i++){
    yuans[i].move();
    yuans[i].display();
    yuans[i].connect();
  }
}
