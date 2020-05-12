class Graf{
  float x=0,y=1,oldX=0,oldY=0;
  float m=1,n=1;
  int col;
  
  
  Graf(int col){
    this.col = col;
  }
  
  void setValues(float m,float n){
    this.m = m;
    this.n = n;
  }
  
  void showGraf(float x,float y, float oldX, float oldY,int index){
    this.x = x;
    this.y = -y;
    this.oldX = oldX;
    this.oldY = oldY;
    
    if(index != 1){
      stroke(col);
      strokeWeight(3);
      line(x,-y,oldX,oldY);
    }
  }
  
  void showPoints(float[] points){
    for(int i=0;i<points.length;i++){
      float nX = ceil(points[i]*50.0);
      if(int(x) == int(nX)){
        stroke(col);
        strokeWeight(2);
        fill(0);
        ellipse(x,y,10,10);
      }
    }
  }
  
  void showPoints(float modulo){
    int nX = int(modulo*50*m);
    if(int(floor(x))%nX == 0 && int(floor(y))!=0){
      stroke(col);
      strokeWeight(2);
      fill(0);
      ellipse(x,y,10,10);
    }
  }
  
  void showPointsXY(){
    if((int(x)>0 && int(oldX)<=0)||(int(x)<=0 && int(oldX)>0)){
      fill(0);
      stroke(col);
      rect(-5,(y+oldY)/2-5,10,10);
    }
    if((int(y) >0 && int(oldY)<=0)||(int(y) <=0 && int(oldY)>0)){
      fill(0);
      stroke(col);
      rect(x-m*2,-5,10,10);
    }
  }
  
  boolean showPointsY(){
    boolean f=false;
    if((int(x)>0 && int(oldX)<=0)||(int(x)<=0 && int(oldX)>0)){
      f=true;
    }
    return f;
  }
  
  boolean showPointsX(){
    boolean f=false;
    if((int(y) >0 && int(oldY)<0)||(int(y) <=0 && int(oldY)>0)){
      f=true;
    }
    return f;
  }
}
