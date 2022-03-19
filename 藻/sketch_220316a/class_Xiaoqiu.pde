class Xiaoqiu{
  
  PVector loc;
  float vx=0,vy=0;
  float r;
  float change_r;
  float angle=0;
  //float R,G,B;
  float cx,cy,c;
  //boolean bianxiao=true;
  
  Xiaoqiu(PVector location,float r){
    loc=location;
    this.r=r;
    change_r=r;
    //R=map(loc.x,0,width,0,10);
    //G=map(loc.x,0,height,255,150);
    //B=map(loc.x,0,width,200,255);
    cx=map(loc.x,0,width,0,180);
    cy=map(loc.y,0,height,0,180);
    c=cx+cy;
    c++;
  }
  
  void update(){
    angle+=0.02*noise(0.001*loc.x,0.001*loc.y);
    vx=2*sin(angle);
    vy=2*cos(angle);
    
    loc.x+=vx;
    loc.y+=vy;
  }
  
  void sizechange(){
    //if(bianxiao) r-=0.1;
    //if(r<=0)bianxiao=false;
    //if(!bianxiao) r+=0.1;
    //if(r>=change_r) bianxiao=true;
    r=voice*400;
  }
  
  void display(){
    noStroke();
    //fill(R,G,B);
    fill(c%360,100,100);
    ellipse(loc.x,loc.y,r,100/r);
  }
  
  void check(){
    if(loc.x<0) loc.x=width;
    if(loc.x>width) loc.x=0;
    if(loc.y<0) loc.y=height;
    if(loc.y>height) loc.y=0;
  }
  
}
