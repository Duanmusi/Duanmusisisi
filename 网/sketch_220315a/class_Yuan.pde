class Yuan{

  float x,y,r;

  Yuan(float x,float y,float r){
    this.x=x;
    this.y=y;
    this.r=r;
   }
   
  void move(){
    x=x+random(-1,1);
    y=y+random(-1,1);
    r=r+random(-0.1,0.1);
  }
  
  void display(){
     for(int i=0;i<yuans.length;i++){
      for(int j=i+1;j<yuans.length;j++){
        if(dist(yuans[i].x,yuans[i].y,yuans[j].x,yuans[j].y)<200){
         fill(0,map(0.8,dist(yuans[i].x,yuans[i].y,yuans[j].x,yuans[j].y),0,255,0));
        }
      }
     }
    noStroke();
    ellipse(x,y,r*2,r*2);
  }
  
  void connect(){
    for(int i=0;i<yuans.length;i++){
      for(int j=i+1;j<yuans.length;j++){
        if(dist(yuans[i].x,yuans[i].y,yuans[j].x,yuans[j].y)<200){
          stroke(255,map(0.8,dist(yuans[i].x,yuans[i].y,yuans[j].x,yuans[j].y),0,voice*1500,0));
          strokeWeight(5-dist(yuans[i].x,yuans[i].y,yuans[j].x,yuans[j].y)*0.02);
          line(yuans[i].x,yuans[i].y,yuans[j].x,yuans[j].y);
        }
      }
    }
  }
}
