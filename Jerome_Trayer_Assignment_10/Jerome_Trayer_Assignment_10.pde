/*
*  Author: Jerome Trayer
 */

//these variables keep track of the rotation of the box lid, and the button object and location
Button button;
float rotation;
boolean keepRotating;
boolean clockwise;
int translateButtonX;
int translateButtonY;

//initialize variables
void setup() {
  size(800, 500);
  rotation = 0.0;
  keepRotating = false;
  clockwise = false;
  translateButtonX = 600;
  translateButtonY = 350;
  button = new Button(translateButtonX, translateButtonY);
}

void draw() {
  background(200);

  //if the lid is in motion or open, set color to blue
  if (clockwise || keepRotating) {
    fill(#33CCFF);
    noStroke();
    rect(width / 2 - 100, height / 2 - 100, 200, 200);
  }

  //set colors for the sides of the boxes
  fill(150);
  stroke(0);

  //rotation and translation for the lid and the button
  pushMatrix();
  translate((width / 2) - 100, (height / 2) - 100);
  rotate(rotation);
  rect(0, 0, 200, 10);
  popMatrix();
  pushMatrix();
  translate(600, 350);
  rotate(-rotation);
  button.display();
  popMatrix();

  //draw other stable sides of the box
  rect((width / 2) + 100, (height / 2) - 100, 10, 200);
  rect((width / 2) - 100, (height / 2) - 100, 10, 200);
  rect((width / 2) - 100, (height / 2) + 100, 210, 10);

  //call rotate function if it should rotate
  if (keepRotating) {
    rotate();
  }
}

void rotate() {
  //change direction
  if (clockwise) {
    rotation += radians(2);
  } else {
    rotation -= radians(2);
  }
  
  //stop cases and set variables for reverse direction
  if (degrees(rotation) >= -1 || degrees(rotation) <= -179) {
    clockwise = !clockwise;
    keepRotating = false;
  }
}

//determine if button is clicked
void mousePressed() {
  if (button.isButtonClicked(mouseX, mouseY)) {
    keepRotating = true;
  }
}