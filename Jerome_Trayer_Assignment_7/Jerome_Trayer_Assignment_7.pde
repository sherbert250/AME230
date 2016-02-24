/*
*  Author: Jerome Trayer
 */

//Reference sited for star function below: https://processing.org/examples/star.html
//Reference for drawing circle of dots based on piece of code found at: https://processing.org/examples/clock.html
//Other segments of code (like the birds and the stars) are taken from my own Assignment 3 and 4 (self-portrait and dynamic tree)
//Reference for those segments can be found on my Github at: https://github.com/sherbert250/AME230

import static javax.swing.JOptionPane.*;

//These are my colors for the clock dots
final int PINK = #e91e63;
final int PURPLE = #4a148c;
final int BLUE = #2196f3;

//these are my colors for the background that represent the time of day
final int BLACK = #000000;
final int GREY = #212121;
final int BLUE_GREY = #263238;
final int LIGHT_BLUE_GREY = #37474F;
final int BROWN = #4E342E;
final int LIGHT_BROWN = #795548;
final int PEACH = #FF9E80;
final int ORANGE = #FF6E40;
final int BRIGHT_RED = #F44336;
final int DEEP_ORANGE = #FF5722;
final int BRIGHT_ORANGE = #F9A825;
final int YELLOW = #EEFF41;

//these are my bird colors
final int BIRD_BLUE = #5DA5DA;
final int BIRD_ORANGE = #FAA43A;
final int BIRD_GREEN = #60BD68;
final int BIRD_PINK = #F17CB0;
final int BIRD_BROWN = #B2912F;
final int BIRD_PURPLE = #B276B2;
final int BIRD_YELLOW = #DECF3F;
final int BIRD_RED = #F15854;

//these are used for the stars
final int PURE_RED = #FF0000;
final int PURE_ORANGE = #FF7F00;
final int PURE_YELLOW = #FFFF00;
final int PURE_GREEN = #00FF00;
final int PURE_BLUE = #00FFFF;
final int PURE_INDIGO = #0000FF;
final int PURE_VIOLET = #7F00FF;

//for adding time to clock
int hoursToAdd;

//rainbow iterator
int currentColor;

//lists of appropriate background objects
ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<Bird> birds = new ArrayList<Bird>();

//lists of background element color palettes
ArrayList<Integer> skyColors = new ArrayList<Integer>();
ArrayList<Integer> birdPalette = new ArrayList<Integer>();
ArrayList<Integer> rainbow = new ArrayList<Integer>();

void setup() {
  size(800, 500);
  frameRate(30);
  hoursToAdd = 0;
  currentColor = 0;

  //this arraylist will hold all of the colors of the sky to represent the time of day
  skyColors.add(BLACK);
  skyColors.add(BLACK);
  skyColors.add(GREY);
  skyColors.add(BLUE_GREY);
  skyColors.add(LIGHT_BLUE_GREY);
  skyColors.add(BROWN);
  skyColors.add(LIGHT_BROWN);
  skyColors.add(PEACH);
  skyColors.add(ORANGE);
  skyColors.add(BRIGHT_RED);
  skyColors.add(DEEP_ORANGE);
  skyColors.add(BRIGHT_ORANGE);
  skyColors.add(YELLOW);
  skyColors.add(YELLOW);
  skyColors.add(BRIGHT_ORANGE);
  skyColors.add(DEEP_ORANGE);
  skyColors.add(BRIGHT_RED);
  skyColors.add(ORANGE);
  skyColors.add(PEACH);
  skyColors.add(LIGHT_BROWN);
  skyColors.add(BROWN);
  skyColors.add(LIGHT_BLUE_GREY);
  skyColors.add(BLUE_GREY);
  skyColors.add(GREY);

  //construct color palette for birds
  birdPalette.add(BIRD_BLUE);
  birdPalette.add(BIRD_ORANGE);
  birdPalette.add(BIRD_GREEN);
  birdPalette.add(BIRD_PINK);
  birdPalette.add(BIRD_BROWN);
  birdPalette.add(BIRD_PURPLE);
  birdPalette.add(BIRD_YELLOW);
  birdPalette.add(BIRD_RED);
  
  //construct rainbow color palette
  rainbow.add(PURE_RED);
  rainbow.add(PURE_ORANGE);
  rainbow.add(PURE_YELLOW);
  rainbow.add(PURE_GREEN);
  rainbow.add(PURE_BLUE);
  rainbow.add(PURE_INDIGO);
  rainbow.add(PURE_VIOLET);

  //explain functionality
  showMessageDialog(null, "To see the full functionality of my clock, \npress the 'h' key to add hours to the clock.\nFrom 6am to 5pm, the birds are out! Click to create birds!\nYour mouse pointer is the bird seed. Watch them follow you!\nWhen the birds go to sleep, the stars are out!\nClick to create cool stars!!!\nEnjoy!", "Directions", INFORMATION_MESSAGE);
}

//the assignment stated that we must have three main drawing functions
//all drawing is organized and handled by the below categories
void draw() {
  strokeWeight(0);
  drawBackground((hour() + hoursToAdd) % 24); 
  drawEvents((hour() + hoursToAdd) % 24); 
  drawClock((hour() + hoursToAdd) % 24, minute(), second()); 
}

//background color handler
//the background gives context to if the sun is up or not
void drawBackground(int currentHour) {
  background(skyColors.get(currentHour)); 
}

//time of day event handler
void drawEvents(int currentHour) {
  if (currentHour < 18 && currentHour > 5) {
    viewBirds();
  } else {
    viewStars();
  }
}

//clock display handler
void drawClock(int currentHour, int currentMinute, int currentSecond) {
  //draw seconds
  setColor(PURPLE);
  strokeWeight(20);
  beginShape(POINTS);
  for (int i = 1; i <= currentSecond; i++) {
    float angle = radians(6 * i) - HALF_PI;
    float x = (width / 2) + cos(angle) * 200;
    float y = (height / 2) + sin(angle) * 200;
    vertex(x, y);
  }
  endShape();

  //draw minutes
  setColor(PINK);
  strokeWeight(17);
  beginShape(POINTS);
  for (int i = 1; i <= currentMinute; i++) {
    float angle = radians(6 * i) - HALF_PI;
    float x = (width / 2) + cos(angle) * 175;
    float y = (height / 2) + sin(angle) * 175;
    vertex(x, y);
  }
  endShape();

  //draw hours
  setColor(BLUE);
  strokeWeight(25);
  beginShape(POINTS);
  for (int i = 1; i <= currentHour; i++) {
    float angle = radians(15 * i) - HALF_PI;
    float x = (width / 2) + cos(angle) * 100;
    float y = (height / 2) + sin(angle) * 100;
    vertex(x, y);
  }
  endShape();
}

//listen to key 'h' to add hours
void keyTyped() {
  if (key == 'H' || key == 'h') {
    hoursToAdd++;
  }
}

//displays birds and handles rebound listener
void viewBirds() {
  for (int i = 0; i < birds.size(); i++) {
    //set bird x and y coordinate to mouse
    if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
      //mouse is on screen
      birds.get(i).setX(mouseX);
      birds.get(i).setY(mouseY);
    }

    //rotate color palette for each bird
    setColor(birdPalette.get(i % 8));
    birds.get(i).display();

    //move bird position for next draw
    birds.get(i).setOffsetX(birds.get(i).getOffsetX() + birds.get(i).getMoveX());
    birds.get(i).setOffsetY(birds.get(i).getOffsetY() + birds.get(i).getMoveY());

    //rebound for bird
    if (birds.get(i).getOffsetX() > 80 || birds.get(i).getOffsetX() < -80) {
      birds.get(i).setMoveX(birds.get(i).getMoveX() * -1);
    }
    if (birds.get(i).getOffsetY() > 10 || birds.get(i).getOffsetY() < 0) {
      birds.get(i).setMoveY(birds.get(i).getMoveY() * -1);
    }
  }
}

//handles night stars display and twinkle
void viewStars() {
  setColor(rainbow.get(currentColor++ % 7));
  for(int i = 0; i < stars.size(); i++) {
    stars.get(i).display();
  }
}

//create new bird or star on mouse press depending on time of day
void mousePressed() {
  if ((hour() + hoursToAdd) % 24 < 18 && (hour() + hoursToAdd) % 24 > 5) {
    birds.add(new Bird());
  } else {
    stars.add(new Star(random(width), random(height)));
  }
}

//makes code more readable to abstract this
void setColor(int newColor) {
  stroke(newColor);
  fill(newColor);
}

//used to create nose of the birds
void createTriangle(int length, int centerBaseX, int centerBaseY) {  
  for (int i = 0; i < length; i++) {
    line(centerBaseX - length/2 + i/2, centerBaseY - i, centerBaseX + length/2 - i/2, centerBaseY - i);
  }
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

//star objects
class Star {
  float x;
  float y;

  Star() {
  }

  Star(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void display() {
    star(x, y, 2, 5, 5);
  }
}

//bird object
class Bird {
  int x;
  int y;
  int moveX;
  int moveY;
  int offsetX;
  int offsetY;
  int bodyHeight;
  int bodyWidth;
  int tailHeight;
  int tailWidth;
  int headRadius;
  int legLength;
  int eyeRadius;
  int noseLength;

  Bird() {
    x = width / 2;
    y = 100;
    moveX = 4;
    moveY = -1;
    offsetX = 0;
    offsetY = 10;
    bodyHeight = 20;
    bodyWidth = 30;
    tailHeight = 5;
    tailWidth = 10;
    headRadius = 15;
    legLength = 15;
    eyeRadius = 1;
    noseLength = 4;
  }

  void display() {
    //body
    ellipse(x + offsetX, y + offsetY, bodyWidth, bodyHeight);

    //tail
    ellipse(x + offsetX + (0.5 * bodyWidth), y + offsetY - (0.3 * bodyHeight), tailWidth, tailHeight);

    //head, eyes, and nose
    ellipse(x + offsetX - (0.5 * bodyWidth), y + offsetY - (0.4 * bodyHeight), headRadius, headRadius);
    setColor(BLACK);
    ellipse(x + offsetX - (0.5 * bodyWidth) - (2 * eyeRadius), y + offsetY - (0.4 * bodyHeight) - (3 * eyeRadius), eyeRadius, eyeRadius);
    ellipse(x + offsetX - (0.5 * bodyWidth) + (2 * eyeRadius), y + offsetY - (0.4 * bodyHeight) - (3 * eyeRadius), eyeRadius, eyeRadius);
    setColor(YELLOW);
    createTriangle(noseLength, (int)(x + offsetX - (0.5 * bodyWidth)), (int)(y + offsetY - (0.2 * bodyHeight)));

    //leg 1 and toes
    line(x + offsetX - (0.5 * legLength), y + offsetY + (0.5 * legLength), x + offsetX - (0.5 * legLength), y + offsetY + (1.5 * legLength));
    line(x + offsetX - (0.8 * legLength), y + offsetY + (1.5 * legLength), x + offsetX - (0.5 * legLength), y + offsetY + legLength);
    line(x + offsetX - (0.2 * legLength), y + offsetY + (1.5 * legLength), x + offsetX - (0.5 * legLength), y + offsetY + legLength);

    //leg 2 and toes
    line(x + offsetX + (0.5 * legLength), y + offsetY + (0.5 * legLength), x + offsetX + (0.5 * legLength), y + offsetY + (1.5 * legLength));
    line(x + offsetX + (0.2 * legLength), y + offsetY + (1.5 * legLength), x + offsetX + (0.5 * legLength), y + offsetY + legLength);
    line(x + offsetX + (0.8 * legLength), y + offsetY + (1.5 * legLength), x + offsetX + (0.5 * legLength), y + offsetY + legLength);
  }

  void setMoveX(int moveX) {
    this.moveX = moveX;
  }

  int getMoveX() {
    return moveX;
  }

  void setMoveY(int moveY) {
    this.moveY = moveY;
  }

  int getMoveY() {
    return moveY;
  }

  void setOffsetX(int offsetX) {
    this.offsetX = offsetX;
  }

  int getOffsetX() {
    return offsetX;
  }

  void setOffsetY(int offsetY) {
    this.offsetY = offsetY;
  }

  int getOffsetY() {
    return offsetY;
  }

  void setX(int x) {
    this.x = x;
  }

  int getX() {
    return x;
  }

  void setY(int y) {
    this.y = y;
  }

  int getY() {
    return y;
  }
}