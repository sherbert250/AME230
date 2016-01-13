/*
*  Author: Jerome Trayer
*/

//set size of window to assignment parameters, set background to black, draw stars for night sky feeling
void setup() {
  final int YELLOW = #FFFF40;
  
  //this size call also sets the system variables 'width' and 'height' which are used later
  size(500, 500);
  background(0);
  
  //draw stars
  setColor(YELLOW);
  drawStars(128);
}

void draw() {
  //it got repetitive changing these everywhere, so I made variables
  final int TRUNK_WIDTH = 32;
  final int TRUNK_HEIGHT = 64;
  final int INITIAL_TRIANGLE_LENGTH = 256;
  final float BRANCH_RATIO = 0.6;
  
  final int BROWN = #FF8040;
  final int GREEN = #80FF40;
  
  //draw trunk
  setColor(BROWN);
  rect(width/2 - TRUNK_WIDTH/2, height - TRUNK_HEIGHT, TRUNK_WIDTH, TRUNK_HEIGHT);
  
  //draw green branches/leaves
  //I'm no artist
  setColor(GREEN);
  createTriangle(INITIAL_TRIANGLE_LENGTH, width/2, height - TRUNK_HEIGHT);
  createTriangle((int)(BRANCH_RATIO * INITIAL_TRIANGLE_LENGTH), width/2, height - TRUNK_HEIGHT - (int)(BRANCH_RATIO * INITIAL_TRIANGLE_LENGTH));
}

//makes code mildly more readable
void setColor(int newColor) {
  stroke(newColor);
  fill(newColor);
}

//function to make triangle since we are only allowed to use line, point, rect, and ellipse in this assignment
void createTriangle(int length, int centerBaseX, int centerBaseY) {  
  for(int i = 0; i < length; i++) {
    line(centerBaseX - length/2 + i/2, centerBaseY - i, centerBaseX + length/2 - i/2, centerBaseY - i);
  }
}

//randomly draws dots on canvas
void drawStars(int amount) {
  for(int i = 0; i < amount; i++) {
    point(random(width), random(height));
  }
}