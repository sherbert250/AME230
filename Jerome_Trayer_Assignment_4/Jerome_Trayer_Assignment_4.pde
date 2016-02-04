/*
*  Author: Jerome Trayer
*/

//reference sited for star function below: https://processing.org/examples/star.html

//these variables will keep track of all the colors that will be used
final int SKY_BLUE = #00BFFF;
final int CREAM = #FFFF99;
final int WHITE = #FFFFFF;
final int ROSE = #FF99C2;
final int LIGHT_GREEN = #B3FFE0;
final int BLACK = #000000;
final int DARK_BROWN = #331A00;
final int BROWN = #994E00;
final int PINK = #FF6666;
final int LIGHT_PINK = #FF8080;
final int GREY = #B3B3B3;
final int HAZEL = #408000;
final int RED = #FF0000;
final int ORANGE = #FF7F00;
final int YELLOW = #FFFF00;
final int GREEN = #00FF00;
final int BLUE = #00FFFF;
final int INDIGO = #0000FF;
final int VIOLET = #7F00FF;

//these variables set some standards for the document
final int CAT_TEXT_SIZE = 96;
final int CAT_STROKE = 3;
final int SELF_TEXT_SIZE = 30;
final int SELF_STROKE = 1;

//This stores the colors of the rainbow for the tongue piercing
ArrayList<Integer> rainbow = new ArrayList<Integer>();

//this variable is to reference the current color which incremements every frame the tongue is drawn
int currentColor;

//this variable toggles between the three faces of my portrait
int toggle;

//setup() sets standards for the drawing
void setup() {
  size(600, 600);
  background(SKY_BLUE);
  textAlign(CENTER, CENTER);
  frameRate(30);

  toggle = 1;
  currentColor = 0;

  rainbow.add(RED);
  rainbow.add(ORANGE);
  rainbow.add(YELLOW);
  rainbow.add(GREEN);
  rainbow.add(BLUE);
  rainbow.add(INDIGO);
  rainbow.add(VIOLET);
}

//This function will be called 30 times a second
void draw() {
  //decide which face to display
  if (toggle % 3 == 0) {
    background(SKY_BLUE);
    strokeWeight(CAT_STROKE);
    strokeCap(ROUND);
    textSize(CAT_TEXT_SIZE);
    drawGrumpyCat();
  } else if (toggle % 3 == 1) {
    background(SKY_BLUE);
    strokeWeight(SELF_STROKE);
    textSize(SELF_TEXT_SIZE);
    drawFace(false);
  } else if (toggle % 3 == 2) {
    background(SKY_BLUE);
    strokeWeight(SELF_STROKE);
    textSize(SELF_TEXT_SIZE);
    drawFace(true);
  }
}

//toggle is incremented we the mouse is pressed
void mousePressed() {
  toggle++;
}

//makes code mildly more readable to abstract this
void setColor(int newColor) {
  stroke(newColor);
  fill(newColor);
}

//this function creates a star centered at (x, y) 
//code for this function was pulled from the processing website at https://processing.org/examples/star.html
void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

//this is the function to draw the face
//the tongue parameter chooses whether or not to draw a tongue on the face
void drawFace(boolean tongue) {

  //text
  setColor(WHITE);
  if (!tongue) {
    text("This isn't even my final form", width / 2, 20);
    text("I dare you to click me...", width / 2, height - 70);
  } else {
    text("Now I'm 50% of the way there", width / 2, 20);
    text("Click again if you dare...", width / 2, height - 70);
  }

  //facial perimeter

  //make the face
  setColor(CREAM);
  beginShape();
  vertex(width / 2 + 119, height / 2);
  vertex(width / 2 + 115, height / 2 - 125);
  vertex(width / 2 + 65, height / 2 - 175);
  vertex(width / 2 - 65, height / 2 - 175);
  vertex(width / 2 - 115, height / 2 - 125);
  vertex(width / 2 - 119, height / 2);
  vertex(width / 2 - 115, height / 2 + 125);
  vertex(width / 2 - 65, height / 2 + 175);
  vertex(width / 2 + 65, height / 2 + 175);
  vertex(width / 2 + 115, height / 2 + 125);
  vertex(width / 2 + 119, height / 2);
  endShape();

  //left ear
  setColor(CREAM);
  beginShape();
  vertex(width / 2 - 140, height / 2 - 32);
  vertex(width / 2 - 155, height / 2 - 20);
  vertex(width / 2 - 150, height / 2 + 15);
  vertex(width / 2 - 140, height / 2 + 50);
  vertex(width / 2 - 125, height / 2 + 60);
  vertex(width / 2 - 120, height / 2 - 10);
  endShape(CLOSE);

  //right ear
  beginShape();
  vertex(width / 2 + 140, height / 2 - 30);
  vertex(width / 2 + 155, height / 2 - 20);
  vertex(width / 2 + 150, height / 2 + 15);
  vertex(width / 2 + 140, height / 2 + 50);
  vertex(width / 2 + 125, height / 2 + 60);
  vertex(width / 2 + 120, height / 2 - 10);
  endShape(CLOSE);



  //hair

  //hair on top of head
  setColor(BROWN);
  beginShape();
  vertex(width / 2 - 120, height / 2);
  vertex(width / 2 - 125, height / 2 - 30);
  vertex(width / 2 - 125, height / 2 - 125);
  vertex(width / 2 - 60, height / 2 - 200);
  vertex(width / 2, height / 2 - 250);
  vertex(width / 2 + 60, height / 2 - 200);
  vertex(width / 2 + 125, height / 2 - 125);
  vertex(width / 2 + 125, height / 2 - 30);
  vertex(width / 2 + 120, height / 2);
  vertex(width / 2 + 120, height / 2);
  vertex(width / 2 + 115, height / 2 - 125);
  vertex(width / 2 + 65, height / 2 - 175);
  vertex(width / 2 - 65, height / 2 - 175);
  vertex(width / 2 - 115, height / 2 - 125);
  vertex(width / 2 - 120, height / 2);
  endShape();

  //beard
  beginShape();
  vertex(width / 2 - 115, height / 2);  
  vertex(width / 2 - 110, height / 2 + 115);
  vertex(width / 2 - 60, height / 2 + 165);
  vertex(width / 2 + 60, height / 2 + 165);
  vertex(width / 2 + 110, height / 2 + 115);
  vertex(width / 2 + 115, height / 2);
  vertex(width / 2 + 124, height / 2 - 5);
  vertex(width / 2 + 120, height / 2 + 130);
  vertex(width / 2 + 70, height / 2 + 180);
  vertex(width / 2 - 70, height / 2 + 180);
  vertex(width / 2 - 120, height / 2 + 130);
  vertex(width / 2 - 124, height / 2 - 5);
  vertex(width / 2 - 115, height / 2);
  endShape();

  //mustache
  beginShape();
  vertex(width / 2 - 70, height / 2 + 160);
  vertex(width / 2 - 60, height / 2 + 80);
  vertex(width / 2 - 25, height / 2 + 60);
  vertex(width / 2 + 30, height / 2 + 60);
  vertex(width / 2 + 60, height / 2 + 85);
  vertex(width / 2 + 70, height / 2 + 160);
  vertex(width / 2 + 55, height / 2 + 170);
  vertex(width / 2 + 50, height / 2 + 90);
  vertex(width / 2 + 30, height / 2 + 75);
  vertex(width / 2 - 20, height / 2 + 70);
  vertex(width / 2 - 50, height / 2 + 90);
  vertex(width / 2 - 55, height / 2 + 170);
  endShape(CLOSE);

  //goatee
  beginShape();
  vertex(width / 2 - 15, height / 2 + 110);
  vertex(width / 2 + 15, height / 2 + 110);
  vertex(width / 2 + 25, height / 2 + 130);
  vertex(width / 2 + 45, height / 2 + 160);
  vertex(width / 2 + 55, height / 2 + 165);
  vertex(width / 2 - 55, height / 2 + 165);
  vertex(width / 2 - 45, height / 2 + 160);
  vertex(width / 2 - 25, height / 2 + 130);
  vertex(width / 2 - 15, height / 2 + 110);
  endShape(CLOSE);



  //lips, tongue, nose

  //bottom lip
  setColor(PINK);
  beginShape();
  vertex(width / 2 - 35, height / 2 + 100);
  vertex(width / 2 - 15, height / 2 + 110);
  vertex(width / 2 + 20, height / 2 + 110);
  vertex(width / 2 + 40, height / 2 + 100);
  endShape(CLOSE);

  //tongue
  if (tongue) {
    stroke(BLACK);
    beginShape();
    vertex(width / 2 + 30, height / 2 + 100);
    vertex(width / 2 + 70, height / 2 + 150);
    vertex(width / 2 + 65, height / 2 + 170);
    vertex(width / 2 + 45, height / 2 + 160);
    vertex(width / 2 - 5, height / 2 + 100);
    endShape(CLOSE);
    setColor(rainbow.get(currentColor++ % 7));
    star(width / 2 + 54, height / 2 + 150, 5, 10, 5);
  }

  //top lips
  setColor(LIGHT_PINK);
  beginShape();
  vertex(width / 2 - 40, height / 2 + 100);
  vertex(width / 2 - 10, height / 2 + 80);
  vertex(width / 2 + 5, height / 2 + 85);
  vertex(width / 2 + 15, height / 2 + 80);
  vertex(width / 2 + 45, height / 2 + 100);
  endShape(CLOSE);

  //nose
  setColor(GREY);
  beginShape();
  vertex(width / 2 + 15, height / 2 - 40);
  vertex(width / 2 + 20, height / 2 - 25);
  vertex(width / 2 + 25, height / 2 + 50);
  vertex(width / 2 - 20, height / 2 + 50);
  vertex(width / 2 - 15, height / 2 + 45);
  vertex(width / 2 + 15, height / 2 + 45);
  endShape(CLOSE);



  //eyes - sclera -> iris -> pupil -> reflection

  //right
  setColor(WHITE);
  ellipse(width / 2 + 55, height / 2 - 60, 60, 30);
  setColor(HAZEL);
  ellipse(width / 2 + 55, height / 2 - 60, 30, 30);
  setColor(BLACK);
  ellipse(width / 2 + 55, height / 2 - 60, 10, 10);
  setColor(WHITE);
  triangle(width / 2 + 55, height / 2 - 60, width / 2 + 75, height / 2 - 70, width / 2 + 65, height / 2 - 75);

  //left
  if (!tongue) {
    setColor(WHITE);
    ellipse(width / 2 - 55, height / 2 - 60, 60, 30);
    setColor(HAZEL);
    ellipse(width / 2 - 55, height / 2 - 60, 30, 30);
    setColor(BLACK);
    ellipse(width / 2 - 55, height / 2 - 60, 10, 10);
    setColor(WHITE);
    triangle(width / 2 - 55, height / 2 - 60, width / 2 - 35, height / 2 - 70, width / 2 - 45, height / 2 - 75);
  } else {
    setColor(BLACK);
    ellipse(width / 2 - 55, height / 2 - 60, 60, 30);
    setColor(CREAM);
    ellipse(width / 2 - 55, height / 2 - 65, 65, 30);
  }



  //eyebrows
  setColor(BROWN);

  //right brow
  beginShape();
  vertex(width / 2 + 65, height / 2 - 80);
  vertex(width / 2 + 95, height / 2 - 65);
  vertex(width / 2 + 100, height / 2 - 70);
  vertex(width / 2 + 65, height / 2 - 90);
  vertex(width / 2 + 20, height / 2 - 90);
  vertex(width / 2 + 20, height / 2 - 80);
  endShape(CLOSE);

  //left brow
  beginShape();
  vertex(width / 2 - 65, height / 2 - 80);
  vertex(width / 2 - 95, height / 2 - 65);
  vertex(width / 2 - 100, height / 2 - 70);
  vertex(width / 2 - 65, height / 2 - 90);
  vertex(width / 2 - 20, height / 2 - 90);
  vertex(width / 2 - 20, height / 2 - 80);
  endShape(CLOSE);
}

void drawGrumpyCat() {
  //meme text
  setColor(WHITE);
  text("NO", width / 2, 60);

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