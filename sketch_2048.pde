int bs = 4, score=0;
int z[][] = new int[bs][bs];
int b[][] = new int[bs][bs];


void setup(){
  
  size(400, 420);
  addzif(2); }
  

void draw(){
  
stroke(255);
strokeWeight(2);
textSize(28);
textAlign(CENTER, CENTER);  
   for (int i = 0; i < bs; i++) {
    for (int j = 0; j < bs; j++) {
      for(int k=1; k<16; k++) {
        
          if(b[i][j]==pow(2,k)) {
            fill(255-(k-1)*17, 0, 70);
            rect(i*100, j*100, 100, 100);
            break;
            }
            
           else {
           fill(240);
           rect(i*100, j*100, 100, 100);
           }  }}}
           

  for (int i = 0; i < bs; i++) {
    for (int j = 0; j < bs; j++) {
      if(b[i][j]!=0) {fill(255); text(b[i][j], i*100+50, j*100+50 );} }}


  if(!canMove()) {
    fill(200, 200, 200, 240);
    rect(0, 0, width, height);
    fill(0);
    text("Game Over!", width / 2, 50);
    text("Your score: " + score, width / 2, 100);
    textSize(20);
    text("Press ENTER to try again", width / 2, height - 50);
  }
  textSize(15); textAlign(LEFT, CENTER);
  fill(240); rect(0,400,400,20);
  fill(0); text("score: " + score, 10, 409);
  
}

boolean canMove() {
  boolean cm = false;
  
    for(int i = 0; i < bs; i++) {
    for(int j = 0; j < bs; j++) {
      if(j < bs - 1 && b[i][j] == b[i][j + 1] ||
         j > 0 && b[i][j] == b[i][j - 1] ||
         i > 0 && b[i][j] == b[i - 1][j] ||
         i < bs-1 && b[i][j] == b[i + 1][j] || b[i][j] == 0 ){
          cm = true;
        }}}

  return cm; }
  
boolean moved(int[][] arr, int[][] arr2 ){
    boolean md =false ;
    
    for (int i = 0; i < bs; i++) {
      for (int j = 0; j < bs; j++) {
        if (b[i][j]!=arr2[i][j]){ md=true; return md; }}}
  return md;

}

void neu(){ 
  for (int i = 0; i < bs; i++) {
    for (int j = 0; j < bs; j++) {
      b[i][j] = 0;
    }}
  
  addzif(1); score=0; }


void addzif(int qolvo){
    for (int i = 0; i < qolvo; i++) {
    int col = floor(random(bs));
    int row = floor(random(bs));

    if (b[row][col] == 0) {
      int exp=ceil(random(0,2));

      if(qolvo==1) b[row][col] = 2;
      else b[row][col] = (int)Math.pow(2,exp);
    } else {
      i--;
      continue;
    }}}


void keyPressed() {
  for (int i = 0; i < bs; i++) {
      for (int j = 0; j < bs; j++) {
        z[i][j]=b[i][j];}}

  switch(keyCode) {
  case DOWN:
    int w=0;
    while (w<4){
    for (int i = 0; i < bs; i++) {
      for (int j = 2; j >=0; j--) {
        if(b[i][j+1]==0 || b[i][j]==b[i][j+1]){ 
          if(b[i][j]==b[i][j+1]) score+=b[i][j]*2;
          b[i][j+1]+=b[i][j];
          b[i][j]=0; 
        } }} w++;}

    break;
   case UP:
   int m=4;
    while (m>0){
    for (int i = 0; i < bs; i++) {
      for (int j = 1; j <bs; j++) {
        if(b[i][j-1]==0 || b[i][j]==b[i][j-1]){
          if(b[i][j]==b[i][j-1]) score+=b[i][j]*2;
          b[i][j-1]+=b[i][j];
          b[i][j]=0; 
        } }} m--;}

    break;
  
  case RIGHT:
    int r=0;
    while (r<4){
    for (int i = 2; i >=0; i--) {
      for (int j = 0; j <bs; j++) {
        if(b[i+1][j]==0 || b[i][j]==b[i+1][j]){
          if(b[i][j]==b[i+1][j]) score+=b[i][j]*2;
          b[i+1][j]+=b[i][j];
          b[i][j]=0; 
        } }} r++;}

    break;
 
  case LEFT:
    int y=0;
    while (y<4){
    for (int i = 1; i <bs; i++) {
      for (int j = 0; j <bs; j++) {
        if(b[i-1][j]==0 || b[i][j]==b[i-1][j]){
          if(b[i][j]==b[i-1][j]) score+=b[i][j]*2;
          b[i-1][j]+=b[i][j];
          b[i][j]=0; 
        } }} y++;}
    break;
  case ENTER:
    if(!canMove()) {
      neu(); 
    }
  }


    if(moved(b,z)) addzif(1); 

}
