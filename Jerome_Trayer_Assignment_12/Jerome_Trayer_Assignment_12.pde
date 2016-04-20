/*
*  Author:  Jerome Trayer
 */

//colors used
final static int SKY_BLUE = #00EEEE;
final static int LIGHT_ORANGE = #FFA64D;
final static int ORANGE = #FF8C1A;
final static int PINK = #E60099;
final static int BLACK = #000000;

//variables for data manipulation
Table table;
ArrayList<Float> dates = new ArrayList<Float>();
ArrayList<Float> values = new ArrayList<Float>();
ArrayList<DataPoint> dataPoints = new ArrayList<DataPoint>();
ArrayList<Float> mappedDates = new ArrayList<Float>();

//chart variables
int xStart;
int yStart;
int chartHeight;
int chartWidth;

void setup() {
  //load data
  table = loadTable("us_avg_temp_1895-2015.csv", "header");

  xStart = width / 8;
  yStart = height / 8;
  chartWidth = 6 * width / 8;
  chartHeight = 6 * height / 8;

  //Note: if on small screen, change size to 900x600. Code is constructed to not use many hardcoded measurements
  size(1200, 800);
  textAlign(CENTER);

  //seperate data into dates and temperatures
  for (TableRow row : table.rows()) {
    dates.add(row.getFloat("Date"));
    values.add(row.getFloat("Value"));
  }

  //min and max used for mapping
  float dateMin = getMin(dates);
  float dateMax = getMax(dates);

  //this loop maps the dates from the dataset to the provided range (1895 - 2015)
  //it then creates a DataPoint object for each element
  for (int i = 0; i < dates.size(); i++) {
    mappedDates.add(map(dates.get(i), dateMin, dateMax, 1895, 2015));
    dataPoints.add(new DataPoint(map(mappedDates.get(i), 1895, 2015, xStart, xStart + chartWidth), map(values.get(i), 30, 55, yStart + chartHeight, yStart), mappedDates.get(i), values.get(i)));
  }
}

void draw() {
  background(SKY_BLUE);

  //chart skeleton
  setColor(BLACK);
  strokeWeight(5);
  textSize(40);
  drawLabels();
  drawAxis();

  //draw data
  textSize(16);
  textAlign(CENTER);
  strokeWeight(3);
  drawConnections();
  drawPoints();
  displayHover();
}

//this draws all the labels for the graph
void drawLabels() {
  //title and major axis labels
  text("U.S. Average March Temperature 1895-2015", width / 2, yStart - 30);
  text("Years", width / 2, yStart + chartHeight + 70);
  //rotate text for y-axis
  int x = xStart - 70;
  int y = height / 2;
  pushMatrix();
  translate(x, y);
  rotate(-HALF_PI);
  translate(-x, -y);
  text("Temperature", x, y);
  popMatrix();

  //tick mark labels
  textSize(16);
  text("1895", xStart, yStart + chartHeight + 30);
  text("1925", xStart + (chartWidth / 4), yStart + chartHeight + 30);
  text("1955", xStart + (chartWidth / 2), yStart + chartHeight + 30);
  text("1985", xStart + (3 * (chartWidth / 4)), yStart + chartHeight + 30);
  text("2015", xStart + chartWidth, yStart + chartHeight + 30);

  text("55", xStart - 45, yStart + 5);
  text("48.75", xStart - 45, yStart + 5 + (chartHeight / 4));
  text("42.5", xStart - 45, yStart + 5 + (chartHeight / 2));
  text("36.25", xStart - 45, yStart + 5 + (3 * (chartHeight / 4)));
  text("30", xStart - 45, yStart + 5 + chartHeight);
}

//this function draws the x-axis, y-axis, and all tick marks
void drawAxis() {
  //major axis
  line(xStart - 10, yStart, xStart - 10, yStart + chartHeight);
  line(xStart - 10, yStart + chartHeight, xStart + chartWidth + 10, yStart + chartHeight);

  //tick marks
  line(xStart - 20, yStart, xStart, yStart);
  line(xStart - 20, yStart + (chartHeight / 4), xStart, yStart + (chartHeight / 4));
  line(xStart - 20, yStart + (chartHeight / 2), xStart, yStart + (chartHeight / 2));
  line(xStart - 20, yStart + (3 * (chartHeight / 4)), xStart, yStart + (3 * (chartHeight / 4)));

  line(xStart + chartWidth + 10, yStart + chartHeight + 10, xStart + chartWidth + 10, yStart + chartHeight - 10);
  line(xStart + (3 * ((chartWidth + 10) / 4)), yStart + chartHeight + 10, xStart + (3 * ((chartWidth + 10) / 4)), yStart + chartHeight - 10);
  line(xStart + ((chartWidth + 10) / 2), yStart + chartHeight + 10, xStart + ((chartWidth + 10) / 2), yStart + chartHeight - 10);
  line(xStart + ((chartWidth + 10) / 4), yStart + chartHeight + 10, xStart + ((chartWidth + 10) / 4), yStart + chartHeight - 10);
}

//this function draws the lines between the data points
void drawConnections() {
  DataPoint previous = dataPoints.get(0);
  for (DataPoint dataPoint : dataPoints) {
    setColor(LIGHT_ORANGE);
    line(previous.x, previous.y, dataPoint.x, dataPoint.y);
    previous = dataPoint;
  }
}

//this function draws the data points
void drawPoints() {
  for (DataPoint dataPoint : dataPoints) {
    setColor(ORANGE);
    dataPoint.display();
  }
}

//this function handles the hover operation
void displayHover() {
  for (DataPoint dataPoint : dataPoints) {
    setColor(PINK);
    dataPoint.displayOnHover(mouseX, mouseY);
  }
}

//returns min of an arraylist of floats
float getMin(ArrayList<Float> list) {
  float min = list.get(0);
  for (float element : list) {
    if (element < min) {
      min = element;
    }
  }
  return min;
}

//returns max of an arraylist of floats
float getMax(ArrayList<Float> list) {
  float max = list.get(0);
  for (float element : list) {
    if (element > max) {
      max = element;
    }
  }
  return max;
}

//this function sets the color for the drawing
void setColor(int newColor) {
  stroke(newColor);
  fill(newColor);
}