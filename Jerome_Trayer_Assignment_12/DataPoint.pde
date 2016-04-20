class DataPoint {
  float x;
  float y; 
  float year;
  float value;

  DataPoint() {
  }

  DataPoint(float x, float y, float year, float value) {
    this.x = x; 
    this.y = y;
    this.year = year;
    this.value = value;
  }

  void display() {
    ellipse(x, y, 3, 3);
  }

  public void displayOnHover(float mouseX, float mouseY) {
    if (dist(mouseX, mouseY, x, y) < 3) {
      text("Year: " + (int)year, x, y - 40);
      text("Temperature: " + value, x, y - 20);
    }
  }
}