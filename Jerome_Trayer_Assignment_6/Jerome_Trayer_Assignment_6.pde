/*
*  Author: Jerome Trayer
 */

//these variables are used for the drawing of the rectangle and circle shapes
int columns;
int rows;
int rectCircOffset;
int squareSize;
int circleSize;

//these variables are used for the drawing of the green rectangles
int greenInitial;
int shadeStep;
int rectangleOffset;
int rectangleCount;
int rectangleStep;

//setup() sets standards for the drawing
void setup() {
  //general drawing setup
  size(800, 500);
  ellipseMode(CENTER);
  strokeWeight(0);
  frameRate(10);
  background(128);

  //green rectangle variable setup
  greenInitial = 99;
  rectangleCount = 13;
  shadeStep = (int)((255 - greenInitial) / rectangleCount);
  rectangleStep = (int)((height / 2) / rectangleCount);
  rectangleOffset = (int)(width / (rectangleCount + 1));

  //rectangle and circle variable setup
  columns = 5;
  rows = 19;
  rectCircOffset = (int)(width / (rows + 1));
  squareSize = (int)(rectCircOffset - 10);
  circleSize = (int)(squareSize - 10);
}

//This function will be called 20 times a second
void draw() {
  //these loops draw the rectangle and circle shapes at the top of the drawing
  noFill();
  stroke(0, 0, 0);
  rectMode(CENTER);
  for (int i = 1; i <= columns; i++) {
    for (int j = 1; j <= rows; j++) {
      rect(j * rectCircOffset, i * rectCircOffset, squareSize, squareSize);
      ellipse(j * rectCircOffset, i * rectCircOffset, circleSize, circleSize);
    }
  }

  //this loop draws the green rectangles at the bottom of the screen while shading appropriately
  rectMode(CORNER);
  for (int i = 1; i <= rectangleCount; i++) {
    setColor(0, greenInitial + (i * shadeStep), 0);
    rect((i * rectangleOffset) - (0.3 * rectangleOffset), height - (i * rectangleStep) - (rectangleOffset / 2) + 10, 2 * rectangleStep, i * rectangleStep);
  }
}

//makes code mildly more readable to abstract this
void setColor(int r, int g, int b) {
  stroke(r, g, b);
  fill(r, g, b);
}