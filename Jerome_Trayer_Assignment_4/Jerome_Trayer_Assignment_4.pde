/*
*  Author: Jerome Trayer
*/

//reference photo: http://static2.businessinsider.com/image/511d104a69bedd1f7c000012/grumpy-cat-still-hates-everyone-at-south-by-southwest.jpg

//these variables will keep track of all the colors that will be used
final int SKY_BLUE = #1FC7FF;
final int CREAM = #FFFF99;
final int WHITE = #FFFFFF;
final int ROSE = #FF99C2;
final int LIGHT_GREEN = #B3FFE0;
final int BLACK = #000000;
final int DARK_BROWN = #331A00;
final int BROWN = #994E00;

//these variables set some standards for the document
final int TEXT_SIZE = 56;
final int STROKE = 3;

//setup() sets standards for the drawing
void setup() {
  size(600, 600);
  background(SKY_BLUE);
  strokeWeight(STROKE);
  strokeCap(ROUND);
  textSize(TEXT_SIZE);
  textAlign(CENTER, CENTER);
}

void draw() {
  //meme text
  setColor(WHITE);
  text("Dashing through the", width / 2, 40);
  text("NO", width / 2, height - 40);

  //ears
  setColor(DARK_BROWN);
  triangle(width / 2, height / 2 + 40, width / 2 - 190, height / 2 + 40, width / 2 - 125, height / 2 - 210);
  triangle(width / 2, height / 2 + 40, width / 2 + 190, height / 2 + 40, width / 2 + 125, height / 2 - 210);

  //head shape
  setColor(CREAM);
  ellipse(width / 2, height / 2 + 40, 400, 360);

  //eyes - outer first, inner last
  //socket
  setColor(BROWN);
  ellipse(width / 2 - 75, height / 2 + 5, 140, 120);
  ellipse(width / 2 + 75, height / 2 + 5, 140, 120);

  //iris - rotate gets a little funky. it skews the width and heighth of the image which throws you off. careful reading this section
  setColor(LIGHT_GREEN);
  rotate(0.2);
  ellipse(width / 2 - 20, height / 2 - 45, 50, 35);
  rotate(-0.4);
  ellipse(width / 2 + 10, height / 2 + 75, 50, 35);
  rotate(0.2);

  //pupil
  setColor(BLACK);
  ellipse(width / 2 - 75, height / 2 + 5, 15, 35);
  ellipse(width / 2 + 75, height / 2 + 5, 15, 35);

  //mouth - draw ellipse in pink and then draw ellipse on top of that slightly offset in cream so that only the upper curve of the pink ellipse is differentiable
  setColor(ROSE);
  ellipse(width / 2, height / 2 + 155, 125, 75);
  setColor(CREAM);
  ellipse(width / 2, height / 2 + 160, 125, 75);

  //nose
  setColor(ROSE);
  triangle(width / 2 - 40, height / 2 + 70, width / 2 + 40, height / 2 + 70, width / 2, height / 2 + 95);

  //bridge nose and mouth
  line(width / 2, height / 2 + 95, width / 2, height / 2 + 115);

  //whiskers
  setColor(WHITE);
  //left
  line(width / 2 - 40, height / 2 + 100, width / 2 - 80, height / 2 + 100);
  line(width / 2 - 40, height / 2 + 95, width / 2 - 75, height / 2 + 85);
  line(width / 2 - 40, height / 2 + 105, width / 2 - 75, height / 2 + 115);

  //right
  line(width / 2 + 40, height / 2 + 100, width / 2 + 80, height / 2 + 100);
  line(width / 2 + 40, height / 2 + 95, width / 2 + 75, height / 2 + 85);
  line(width / 2 + 40, height / 2 + 105, width / 2 + 75, height / 2 + 115);
}

//makes code mildly more readable to abstract this
void setColor(int newColor) {
  stroke(newColor);
  fill(newColor);
}