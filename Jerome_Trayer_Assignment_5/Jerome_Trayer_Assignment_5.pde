/*
*  Author: Jerome Trayer
 */

//these variables will keep track of all the colors that will be used
final int BLACK = #000000;
final int RED = #FF0000;
final int GREEN = #00FF00;

//this variable toggles between the colors of the box
int state;

//setup() sets standards for the drawing
void setup() {
  size(600, 400);
  background(RED);
  state = 0;
  rectMode(CENTER);
}

//This function will be called 60 times a second
void draw() {
  //decide which color to set for the rectangle  
  if (state % 6 == 0) {
    setColor(BLACK);
  } else if (state % 2 == 0) {
    setColor(GREEN);
  }
  rect(width / 2, height / 2, 200, 200);
}

//state is incremented when the mouse is pressed inside the box perimeter
void mousePressed() {
  if (mouseX < width / 2 + 100 && mouseX > width / 2 - 100 && mouseY > height / 2 - 100 && mouseY < height / 2 + 100) {
    state++;
  }
}

//makes code mildly more readable to abstract this
void setColor(int newColor) {
  stroke(newColor);
  fill(newColor);
}