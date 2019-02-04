int dotsMax;

float[] dotSize = new float[100];

float[] dotsX = new float[100];
float[] dotsY = new float[100];

float[] d = new float[100]; //direction

void setup(){
  size(600, 600);
  noStroke();
  fill(225, 0, 0);
}

void draw(){
  background(225);
  for (int i=1; i<=dotsMax; i++){
    dotsX[i]=dotsX[i]+cos(d[i]);
    dotsY[i]=dotsY[i]+sin(d[i]);
    ellipse(dotsX[i], dotsY[i], dotSize[i], dotSize[i]);
    if (dotsX[i]>=600 || dotsX[i]<=0){
      d[i]+=PI;
    }
    else if (dotsY[i]>=600 || dotsY[i]<=0){
      d[i]*=-1;
    }
    
    for (int j=1; j<=dotsMax; j++){
      if (sqrt(sq(dotsX[j]-dotsX[i])+sq(dotsY[j]-dotsY[i])) <=150){
        strokeWeight(1);
        stroke(225-(1.5*sqrt(sq(dotsX[j]-dotsX[i])+sq(dotsY[j]-dotsY[i]))),
        100-(1.5*sqrt(sq(dotsX[j]-dotsX[i])+sq(dotsY[j]-dotsY[i]))), 
        100-(1.5*sqrt(sq(dotsX[j]-dotsX[i])+sq(dotsY[j]-dotsY[i]))));
        line(dotsX[i], dotsY[i], dotsX[j], dotsY[j]);
      }
    }
  }
}

void mouseClicked(){
  dotSize[dotsMax]=random(4, 8);
  dotsMax+=1;
  d[dotsMax] = random(0, 2*PI);
  dotsX[dotsMax]=mouseX;
  dotsY[dotsMax]=mouseY;
}
