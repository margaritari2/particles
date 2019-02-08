//by Eleanor Kuchar

boolean day = true;
int dotsMax;
float[] dotSize = new float[1000];
float[] dotsX = new float[1000];
float[] dotsY = new float[1000];
float[] d = new float[1000];

void setup(){
  size(1365, 724);
  noStroke();
}

void draw(){
  if (day == true)background(300, 300, 300); else if (day == false)background(0);
  
  if (day == true)fill(0, 0, 25); 
  if (day == false)fill(225, 200, 200);
  for (int i=1; i<=dotsMax; i++){
    dotsX[i]=dotsX[i]+cos(d[i]);
    dotsY[i]=dotsY[i]+sin(d[i]);
    ellipse(dotsX[i], dotsY[i], dotSize[i], dotSize[i]);
    if (dotsX[i]>=1365 || dotsX[i]<=0){
      d[i]+=PI;
    }
    else if (dotsY[i]>=724 || dotsY[i]<=0){
      d[i]*=-1;
    }
    
    for (int j=i; j<=dotsMax; j++){
      if (sqrt(sq(dotsX[j]-dotsX[i])+sq(dotsY[j]-dotsY[i])) <=150){
        strokeWeight(1.5);
        if (day == true){
        stroke(10+(1.5*sqrt(sq(dotsX[j]-dotsX[i])+sq(dotsY[j]-dotsY[i]))),
        10+(1.5*sqrt(sq(dotsX[j]-dotsX[i])+sq(dotsY[j]-dotsY[i]))), 
        35+(1.5*sqrt(sq(dotsX[j]-dotsX[i])+sq(dotsY[j]-dotsY[i]))));
        line(dotsX[i], dotsY[i], dotsX[j], dotsY[j]);}
        else if (day ==false){
        stroke(225-(1.5*sqrt(sq(dotsX[j]-dotsX[i])+sq(dotsY[j]-dotsY[i]))),
        100-(1.5*sqrt(sq(dotsX[j]-dotsX[i])+sq(dotsY[j]-dotsY[i]))), 
        100-(1.5*sqrt(sq(dotsX[j]-dotsX[i])+sq(dotsY[j]-dotsY[i]))));
        line(dotsX[i], dotsY[i], dotsX[j], dotsY[j]);
        } 
      }
    }
  }
}

void keyPressed(){if (day == true)day=false; else day=true;}

void mouseClicked(){
  dotSize[dotsMax]=random(4, 8);
  dotsMax+=1;
  d[dotsMax] = random(0, 2*PI);
  dotsX[dotsMax]=mouseX;
  dotsY[dotsMax]=mouseY;
}
