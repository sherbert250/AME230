class Button {
  
  int radius;
  
  //x and y are used for drawing since there is a rotation and translating called before it is drawn
  int x;
  int y;
  
  //translateX and translateY are used for the actual position of the button without rotation and translation
  int translateX;
  int translateY;
  
  Button(int translateX, int translateY) {
    radius = 20;
    x = 0;
    y = 0;
    this.translateX = translateX;
    this.translateY = translateY;
  }
  
  //this draws the button with two diameters
  void display() {
    ellipse(x, y, radius * 2, radius * 2);
    line(x - radius, y, x + radius, y);
    line(x, y - radius, x, y + radius);
  }
  
  //detect if button is clicked. return true if it is, otherwise false
  boolean isButtonClicked(int mouseX, int mouseY) {
    if(dist(translateX, translateY, mouseX, mouseY) < radius) {
      return true;
    }
    return false;
  }
}