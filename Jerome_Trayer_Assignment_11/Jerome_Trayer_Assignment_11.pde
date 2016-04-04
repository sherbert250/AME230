/*
*  Author:  Jerome Trayer
 */

import static javax.swing.JOptionPane.*;

//interactive event: Press the 'e' key to make me evolve :)

//these variables will keep track of all the colors that will be used outside what is obtained from the image
final int SKY_BLUE = #00BFFF;
final int CREAM = #FFFF99;
final int WHITE = #FFFFFF;
final int ROSE = #FF99C2;
final int LIGHT_GREEN = #B3FFE0;
final int BLACK = #000000;
final int DARK_BROWN = #331A00;
final int BROWN = #994E00;

//these globals define the images and behavior of the application
PImage secondEvolution;
PImage firstEvolution;
ArrayList<PImage> images;
int displayImage;
int step;
boolean isEvolving;

//setup() sets standards for the drawing
void setup() {
  size(500, 500);
  frameRate(10);
  textAlign(CENTER, CENTER);
  firstEvolution = loadImage("firstEvolution.jpg"); //photo courtesy of my facebook page
  firstEvolution.loadPixels();
  secondEvolution = loadImage("secondEvolution.jpg"); //photo courtesy of my facebook page
  secondEvolution.loadPixels();
  step = 1;
  displayImage = 0;
  isEvolving = false;
  images = new ArrayList<PImage>();
  images.add(firstEvolution);
  images.add(secondEvolution);
}

//This function will be called 10 times a second
void draw() {
  background(SKY_BLUE);
  //display final evolution and override evolving animation
  if(displayImage >= 2) {
    textSize(96);
    drawGrumpyCat();
  }
  //in process of evolving
  else if(isEvolving) {
    //this is how I pixelate my image
    if(step <= 100) {
      for (int y = 0; y < height; y += step) {
        for (int x = 0; x < width; x += step) {
          setColor(computeColorFamily(x, y));
          rect(x, y, step, step);
        }
      }
      step++;
    }
    //ending of evolution process
    else {
      step = 1;
      isEvolving = false;
      if(displayImage == 0) {
        showMessageDialog(null, "Congratulations! Your KID JERRY evolved into TEEN JERRY!", "Notice", INFORMATION_MESSAGE);
      }
      else {
        showMessageDialog(null, "Congratulations! Your TEEN JERRY evolved into ....", "Notice", INFORMATION_MESSAGE);
      }
      displayImage++;
    }
  }
  //have not pressed evolution key yet. display raw image, but we are not allowed to use 'image()' function. only primitives
  else {
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        setColor(images.get(displayImage).pixels[x + y * images.get(displayImage).width]);
        rect(x, y, 1, 1); //if you want to play with this and see something interesting, change this 'rect' to 'point'
      }
    }
    if(displayImage == 0) {
      textSize(27);
      setColor(BLACK);
    }
    else {
      textSize(21);
      setColor(WHITE);
    }
    text("Press the 'e' key to make me evolve!", width / 2, 20); //explanation of interactive event required for assignment
  }
}

//this magical function gets the neighbors of a pixel and computes their average color.
//it computes the average color of the two dimensional array with upper left coordinate (x,y)
//the size of that array is held by the variable 'steps'
//notice that 'steps' is incremented in the draw function. Thus, the neighborhoods grow bigger making bigger pixels
int computeColorFamily(int x, int y) {
  int count = 0;
  float r = 0;
  float g = 0;
  float b = 0;
  for(int column = 0; column < step; column++) {
    for(int row = 0; row < step; row++) {
      int location = (x + row) + (y + column) * images.get(displayImage).width;
      if(location < 250000) {
        r += red(images.get(displayImage).pixels[location]);
        g += green(images.get(displayImage).pixels[location]);
        b += blue(images.get(displayImage).pixels[location]);
        count++;
      }
    }
  }
  return color(r / count, g / count, b / count);
}

//this function sets the color for the drawing
void setColor(int newColor) {
  stroke(newColor);
  fill(newColor);
}

//listen to key 'e' to trigger evolution
void keyTyped() {
  if (key == 'E' || key == 'e') {
  if(displayImage < 2) {
      isEvolving = true;
      if(displayImage == 0) {
        showMessageDialog(null, "What?\nKID JERRY is evolving!", "Notice", INFORMATION_MESSAGE);
      }
      else {
        showMessageDialog(null, "What?\nTEEN JERRY is evolving!", "Notice", INFORMATION_MESSAGE);
      }
    }
  }
}

//the famous grumpy cat drawing function
void drawGrumpyCat() {
  //meme text
  setColor(WHITE);
  text("NO", width / 2, 50);

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
  ellipse(width / 2 - 30, height / 2 - 35, 50, 35);
  rotate(-0.4);
  ellipse(width / 2 + 20, height / 2 + 65, 50, 35);
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