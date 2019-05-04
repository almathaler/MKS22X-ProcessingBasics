int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y;
  float [] values;
  float [] speeds;
  Visualizer(float x, float y) {
    this.x = x;
    this.y = y;
    values = new float[10];
    speeds = new float[10];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }

  void display() {
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    fill(255);
    rect(x, y, 400, 200);
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+100, x+400, y+100);

    //You need to use a loop. You need to make the HEIGHT of the bars 
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.
    //???WRITE THIS METHOD FIRST!!!
    //THESE ARE WRONG: They just illustrate how they could look
    float rectWidth = 400/(values.length); //x val of rect will be rectWidth * i
    for (int i = 0; i<values.length; i++){
     if (100-values[i] > 100){
       fill(255, 0, 0); //if the value is (-) and bar below line, red
       rect(x+(rectWidth*i), y+100, rectWidth, values[i]*-1);
     }else{
       fill(0, 255, 0); //else green
       rect(x+(rectWidth*i), y+(100-values[i]), rectWidth, values[i]);
     }
    }


    //Width of the visualizer is 400!

  
  }
  void update() {
    //???WRITE THIS METHOD SECOND!!!
    for (int i = 0; i < values.length; i++) {
      values[i] += speeds[i]; //the speed updates the values. Do not touch this.
      //??? keep them values between max/min value so they stay in the box.
      //??? reverse the speeds so the bar oscillates up/down when it reaches max/min
      //max: 100 - values[i] == y min: y + (100 - values[i]) == 200
      if (100 - values[i] < 0){ //if height is above 100 and positive
        values[i] = 100;
        speeds[i] *= -1;
      }
      if (y + (100-values[i]) > 200+y){ //if height is more than 100 above the line
        values[i] = -100;
        speeds[i] *= -1;
      }
      
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
