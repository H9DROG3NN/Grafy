class EditTab{
  int fillCell=51;
  
  
  void show(ArrayList<Integer> aX, int[] col){
    fill(64);
    noStroke();
    rect(0,0,1900,100);
    stroke(255);
    strokeWeight(3);
    line(0,100,width,100);
    
    for(int i=0;i<pGrafov;i++){
      fillCell = col[i];
      
      stroke(255);
      strokeWeight(2);
      fill(fillCell);
      rect(i*(85)+15,15,70,70);
      
      if(aX.get(i+1)==2000){
        fillCell=32;
      }else{
        fillCell=255;
      }
      fill(fillCell);
      stroke(64);
      rect(i*(85)+25,25,50,50);
      if(aX.get(i+1)==2000){
        fill(255);
      }else{
        fill(32);
      }
      
      if(i+1<10){
        textSize(50);
        text(i+1,i*(85)+35,70);
      }else{
        textSize(40);
        text(i+1,i*(85)+25,65);
      }
    }
  }
}
