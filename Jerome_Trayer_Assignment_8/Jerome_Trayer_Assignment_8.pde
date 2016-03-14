/*
//  Original Author: Loren Olson
//  Alterations by: Jerome Trayer
*/

// Bounce4
// Simple ball bounce in 2d.
// The bounces are no longer perfect. Some energy is lost
// everytime there is a bounce. (bounciness) Also, we added
// gravity.

final static int AMOUNT_OF_BALLS = 3;

float gravity;
float bounciness;

Ball[] balls;

void setup() {
  size( 1200, 600 );
  noStroke();
  gravity = 0.5;
  bounciness = 0.7;
  balls = new Ball[AMOUNT_OF_BALLS];
  initiateBalls();
}

// Set the initial conditions for the balls, prior to bouncing.
void initiateBalls() {
  for(int i = 0; i < balls.length; i++) {
    balls[i] = new Ball(width, height);
  }
}

//move and display balls
void draw() {
  background( 128 );
  for(int i = 0; i < balls.length; i++) {
    balls[i].render();
    balls[i].move(gravity, bounciness);
  }
}

//reset all balls on key press
void keyPressed() {
  initiateBalls();
}