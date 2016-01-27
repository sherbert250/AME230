/*
*  Author: Jerome Trayer
*/

import static javax.swing.JOptionPane.*;

//set static variables
//these colors are strategically chosen for differentiation.
//see http://www.mulinblog.com/a-color-palette-optimized-for-data-visualization/
final int WHITE = #FFFFFF;
final int BLACK = #000000;
final int BLUE = #5DA5DA;
final int ORANGE = #FAA43A;
final int GREEN = #60BD68;
final int PINK = #F17CB0;
final int BROWN = #B2912F;
final int PURPLE = #B276B2;
final int YELLOW = #DECF3F;
final int RED = #F15854;

final float MOON_RADIUS = 75;
final int TRUNK_WIDTH = 32;
final int TRUNK_HEIGHT = 64;
final int INITIAL_TRIANGLE_LENGTH = 256;
final float BRANCH_RATIO = 0.6;
final int AMOUNT_OF_STARS = 128;

//declare new list of stars
ArrayList<Star> stars = new ArrayList<Star>();

//declare new bird
ArrayList<Bird> birds = new ArrayList<Bird>();

//declare palette list for birds
ArrayList<Integer> palette = new ArrayList<Integer>();

void setup() {

  //this size call also sets the system variables 'width' and 'height' which are used later
  size(500, 500);
  
  //helps the birds fly slower
  frameRate(30);
  
  //explain functionality
  showMessageDialog(null, "Hi! Move your mouse to control where the bird flies!\nClick to create more birdies!\nEnjoy!", "Directions", INFORMATION_MESSAGE);

  //generate star positions for the night time feel
  generateStars(AMOUNT_OF_STARS);

  //construct bird
  birds.add(new Bird());
  
  //construct color palette
  palette.add(BLUE);
  palette.add(ORANGE);
  palette.add(GREEN);
  palette.add(PINK);
  palette.add(BROWN);
  palette.add(PURPLE);
  palette.add(YELLOW);
  palette.add(RED);
}

void draw() {
  background(0);
  
  //draw stars
  setColor(YELLOW);
  drawStars();

  //draw moon
  setColor(WHITE);
  ellipse(width - (1.2 * MOON_RADIUS), 1.2 * MOON_RADIUS, MOON_RADIUS, MOON_RADIUS);
  setColor(BLACK);
  ellipse(width - (2.2 * MOON_RADIUS), 1.2 * MOON_RADIUS, 2 * MOON_RADIUS, 2 * MOON_RADIUS);

  //draw trunk
  setColor(BROWN);
  rect(width/2 - TRUNK_WIDTH/2, height - TRUNK_HEIGHT, TRUNK_WIDTH, TRUNK_HEIGHT);

  //draw green branches/leaves
  //I'm no artist
  setColor(GREEN);
  createTriangle(INITIAL_TRIANGLE_LENGTH, width/2, height - TRUNK_HEIGHT);
  createTriangle((int)(BRANCH_RATIO * INITIAL_TRIANGLE_LENGTH), width/2, height - TRUNK_HEIGHT - (int)(BRANCH_RATIO * INITIAL_TRIANGLE_LENGTH));

  //draw birds
  //I'm still not an artist
  for (int i = 0; i < birds.size(); i++) {
    //set bird x and y coordinate to mouse
    if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
      //mouse is on screen
      birds.get(i).setX(mouseX);
      birds.get(i).setY(mouseY);
    }

    //rotate color palette for each bird
    setColor(palette.get(i % 8));
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

//create new bird on mouse press
void mousePressed() {
  birds.add(new Bird());
}

//makes code mildly more readable to abstract this
void setColor(int newColor) {
  stroke(newColor);
  fill(newColor);
}

//function to make triangle since we are only allowed to use line, point, rect, and ellipse in this assignment
void createTriangle(int length, int centerBaseX, int centerBaseY) {  
  for (int i = 0; i < length; i++) {
    line(centerBaseX - length/2 + i/2, centerBaseY - i, centerBaseX + length/2 - i/2, centerBaseY - i);
  }
}

//set position for stars
void generateStars(int amount) {
  float randomX = 0;
  float randomY = 0;
  for (int i = 0; i < amount; i++) {
    randomX = random(width);
    randomY = random(height);
    stars.add(new Star(randomX, randomY));
  }
}

//draw stars from array
void drawStars() {
  for (int i = 0; i < stars.size(); i++) {
    stars.get(i).display();
  }
}

//stars objects
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
    point(x, y);
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