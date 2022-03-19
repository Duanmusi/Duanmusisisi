import ddf.minim.*;
Minim   minim;
AudioPlayer music;
float voice;

void setup(){
size (800, 800);
background(255);
minim=new Minim(this);
music=minim.loadFile("music.mp3",1024); 
music.loop();
}
void draw()
{
voice=music.mix.level();
noStroke();
fill(voice*800,voice*700);
ellipse (width/2, height/2, voice*2300, voice*2300) ;
}
