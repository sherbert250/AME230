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
    x = random( radius + 5.0, pageWidth - radius - 5 );
    y = random( radius + 5.0, pageHeight - radius - 5 );
    velocityX = random( -4.0, 4.0 );
    velocityY = random( -4.0, 4.0 );
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
  void move(float bounciness) {
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
  
  //this function moves any ball within a 200px box around the mouse away from the mouse
  void disperse(int mouseX, int mouseY) {
    if(x - mouseX < 200 && x - mouseX > -200 && y - mouseY < 200 && y - mouseY < 200) {
      //option1: balls closer to the mouse move faster than balls further from the mouse
      //velocityX = (x - mouseX) / 50.0 < 0 ? -4 + (x - mouseX) / 50.0 : 4 - (x - mouseX) / 50.0;
      //velocityY = (y - mouseY) / 50.0 < 0 ? -4 + (y - mouseY) / 50.0 : 4 - (y - mouseY) / 50.0;
      
      //option2: balls closer to the mouse move slower than balls further from the mouse
      velocityX = (x - mouseX) / 50.0;
      velocityY = (y - mouseY) / 50.0;
    }
  }
}