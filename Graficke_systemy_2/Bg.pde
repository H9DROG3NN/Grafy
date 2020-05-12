class Bg{
  float m,n;
  
  Bg(float m, float n){
    this.m = m;
    this.n = n;
  }
  
  void showDetail(){
    
    stroke(64);
    strokeWeight(1);
    for(int i=-900;i<=900;i+=50){
      line(i,-500,i,500);
    }
    for(int j=-450;j<=450;j+=50){
      line(-950,j,950,j);
    }
    
    
    
  }
  
  void showMain(){
    textSize(10);
    fill(255);
    stroke(255);
    strokeWeight(3);
    for(int i=-900;i<=900;i+=50){
      line(i,-5,i,5);
      if(i!=0){
        stroke(255);
        text(i/50.0/m,i-20,20);
      }
    }
    for(int j=-400;j<=400;j+=50){
      line(-5,j,5,j);
      if(j!=0){
        stroke(255);
        text(-j/50.0/n,-50,j+5);
      }
    }
    
    strokeWeight(3);
    stroke(255);
    line(-950,0,950,0);
    line(0,-500,0,500);
    
    stroke(255);
    fill(0);
    ellipse(0,0,10,10);
  }
  
  void showText(String[] s,int[] col){
    float textWidth=0;
    for(int i=0;i<s.length;i++){
      if(textWidth(s[i])>textWidth){
        textWidth = textWidth(s[i]);
      }
    }
    stroke(255);
    fill(32);
    int len;
    if(s.length > pGrafov){
      len = pGrafov;
    }
    else{
      len = s.length;
    }
    rect(-915,-435,textWidth*2+25+30,len*25+25);
    for(int i=0; i<s.length && i<pGrafov; i++){
      fill(col[i]);
      noStroke();
      textSize(20);
      rect(-900,-420+i*30,15,15);
      text(s[i],-875,-425+i*30+15);
    }
  }
  
  void showPoints(ArrayList<Float> x, ArrayList<Float> y, ArrayList<Integer> nX, ArrayList<Integer> nY){
    for(int a=0;a<pGrafov;a++){
      String s=(a+1)+".  "+"x=[";
      for(int i=1 ; i<x.size() ;i++){
        if(nX.get(i)==a){
          s+=x.get(i);
          s+=";";
        }
      }
      s+="]  y=[";
      for(int i=1 ; i<y.size() ;i++){
        if(nY.get(i)==a){
          s+=y.get(i);
          s+=";";
        }
      }
      s+="]";
      println(s);
    //println(x.size());
    }
  }
}
