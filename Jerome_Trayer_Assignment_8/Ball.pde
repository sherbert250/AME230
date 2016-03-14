class Ball {

  float x;
  float y;
  float radius;
  float velocityX;
  float velocityY;
  float r;
  float g;
  float b;
  int pageWidth;
  int pageHeight;
  
  //constructor
  Ball(int pageWidth, int pageHeight) {
    this.pageWidth = pageWidth;
    this.pageHeight = pageHeight;
    radius = 30.0;
    x = random( radius + 5.0, pageWidth / 2 );
    y = random( radius + 5.0, pageHeight / 2 );
    velocityX = random( 2.0, 8.0 );
    velocityY = random( 2.0, 8.0 );
    r =  random( 0.0, 255.0 );
    g = random( 0.0, 255.0 );
    b = random( 0.0, 255.0 );
  }
  
  //this function is for displaying the ball in it's current position
  void render() {
    fill( r, g, b );
    ellipse( x, y, radius * 2, radius * 2 );
  }  
  
  //this function moves the ball in the window and handles rebound
  void move(float gravity, float bounciness) {
    velocityY = velocityY + gravity;
    x = x + velocityX;
    y = y + velocityY;
    
    if ((x - radius) < 0) {
      velocityX = velocityX * -1.0 * bounciness;
      velocityY *= bounciness;
      x = radius;
    }
    else if ((x + radius) > pageWidth) {
      velocityX = velocityX * -1.0 * bounciness;
      velocityY *= bounciness;
      x = pageWidth - radius;
    }
    if ((y - radius) < 0) {
      velocityY = velocityY * -1.0 * bounciness;
      velocityX *= bounciness;
      y = radius;
    }
    else if ((y + radius) > pageHeight) {
      velocityY = velocityY * -1.0 * bounciness;
      velocityX *= bounciness;
      y = pageHeight - radius;
    }
  }
}