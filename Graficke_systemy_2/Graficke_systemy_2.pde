Bg b;
Graf[][] g;
EditTab e;

float m=1,n=1; //m = priblizenie na osi x, n = priblizenie na osi y, ak date desatinne cislo tak graf oddiali
int pGrafov=3; //pocet grafov kolko chcete mat v grafickom systeme
int h=450; //minimalna svetlost farieb, cim vyssie cislo tym svetlejsie | h nesmie byt vacsie ako 750

boolean[] xyPoints = new boolean[pGrafov];

ArrayList<Float> alX = new ArrayList<Float>();
ArrayList<Float> alY = new ArrayList<Float>();

ArrayList<Integer> nX = new ArrayList<Integer>();
ArrayList<Integer> nY = new ArrayList<Integer>();

ArrayList<Integer> aX = new ArrayList<Integer>();

float[] points = {1,2,4}; // body, ktoré zvýrazní v grafe

int[] colors = {#ff0000,#ff8800,#88ff00}; //farby grafov v type HEX

int[] col = new int[pGrafov];

String[] s = {"y=2+x","y=x/2+1","y=2-2*x"}; //text grafov pre urcenie (moze byt aj "1","2")

int mX;

void setup(){
 size(1900,1000); 
 b = new Bg(m,n);
 g = new Graf[pGrafov][1900];
 e = new EditTab();
 
 xyPoints[0] = true;
 
 for(int i=0;i<colors.length && i<pGrafov;i++){
   col[i] = colors[i];
 }
 for(int j=colors.length;j<pGrafov;j++){
   int r=0,g=0,b=0;
   while(4*(r+g+b) < h){
   r = int(random(0,63));
   g = int(random(0,63));
   b = int(random(0,63));
   }
   color c = color(4*r,4*g,4*b);
   col[j] = c;
 }
 for(int b=0;b<pGrafov;b++){
   for(int a=0;a<1900;a++){
     g[b][a] = new Graf(col[b]);
     g[b][a].y=1;
   }
 }
 aX.add(2000);
 for(int i=1;i<=pGrafov;i++){
    aX.add(i-1);
  }
}

void draw(){
  alX.clear();
  alY.clear();
  
  alX.add(2000.0);
  alY.add(2000.0);
  nX.add(2000);
  nY.add(2000);
  
  
  //println(alX.get(0));
  translate(width/2,height/2+50);
  background(51);
  b.showDetail();
  float x=-19;
  float []y = new float[pGrafov];
  for(int i=1;i<1900;i++,x+=0.02){
    
    y[0] = x+2;      //rovnice grafov | y[index(od 0 po (pocet grafov-1) vratane)] = rovnica
    y[1] = x/2+1;          //index i nemoze byt vačší ako (pocet grafov - 1)
    y[2] = 2-2*x/3;
    
    for(int j=0;j<pGrafov;j++){
      for(int z=1;z<aX.size();z++){
        if(aX.get(z)==j){
          float oldX = g[j][i-1].x;
          float oldY = g[j][i-1].y;
          g[j][i].setValues(m,n);
          g[j][i].showGraf(50*x*m,y[j]*50*n,oldX,oldY,i);
        }
      }
    }
  }
  b.showMain();
  for(int i=1;i<1900;i++){
    for(int j=0;j<pGrafov;j++){
      for(int z=1;z<aX.size();z++){
        if(aX.get(z)==j){
          g[j][i].showPoints(1); //body ktore ma zvyrazmit (ak su to urcite body tak showPoints(points), ak kazde n-te showPoints(n(nasobok))) | showPoints(points) alebo showPoints(1), showPoints(1.5)
        }
      }//ak to g[j][i].showPoints(1) nahradite g[j][i].showPoints(points) tak to zvýrazní len zadané body v grafe;
    }
  }
  int xIndex=0;
  int yIndex=0;
  for(int i=1;i<1900;i++){
    for(int j=0;j<pGrafov;j++){
      if(g[j][i].showPointsX()){
        if(abs(alX.get(xIndex) - floor(g[j][i].x)/50.0/m) > 0.1){
          alX.add(floor(g[j][i].x)/50.0/m);
          nX.add(j);
          xIndex++;
        }
      }
      if(g[j][i].showPointsY()){
        if(abs(alX.get(yIndex) - floor(g[j][i].y)/50.0/m) > 0.1){
          alY.add((floor(g[j][i].y)+floor(g[j][i].oldY))/2.0/50.0/n);
          nY.add(j);
          yIndex++;
        }
      }
    }
  }
  for(int i=1;i<1900;i++){
    for(int j=0;j<pGrafov;j++){
      for(int z=1;z<aX.size();z++){
        if(aX.get(z)==j){
          g[j][i].showPointsXY();
        }
      }
    }
  }
  b.showText(s,col);
  println("\n");
  translate(-width/2,-(height/2+50));
  e.show(aX,col);
  b.showPoints(alX,alY,nX,nY);
  //kocky v grafe sú miesta kde sa graf pretne s osou x alebo y
  //gulky v grafe su vyznacene dolezita miesta v grafe
}

void keyPressed(){    //po stlačení "s" na klávesnici sa uloží obraz grafu do priečinku s projektom
  if(key == 's'){
    save("7_5_20_4.jpg");  //(názov).(typ súboru: napr. jpg, png,
  }
}

void mouseClicked(){
  mX = mouseX;
  int mY = mouseY;
  int resX = int((mX-15)/85);
  if(mY > 15 && mY < 85){
    if(resX+1<aX.size()){
      if(aX.get(resX+1)==2000){
        aX.set(resX+1,resX);
      }else{
        aX.set(resX+1,2000);
      }
    }
  }
}
