Box myBox1;
Box myBox2;
//objects
void setup() {
  size(300, 300);
  myBox1 = new Box(color(255, 0, 0), 150, 150, 0, 2); //parameters
  myBox2 = new Box(color(0, 0, 255), 150, 150, 2, 0);
}

void draw() {
  background(255);
  myBox1.drive();
  myBox1.display();
  myBox2.drive();
  myBox2.display();
}
//one class
class Box {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  //Constructor
  Box(color tempC, float tempXpos, float tempYpos, float tempXspeed, float tempYspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    yspeed = tempYspeed;
  }

  void display() {
    stroke(0);
    fill(c); //color
    rectMode(CENTER);
    rect(xpos, ypos, 20, 10); //drawing the box
  }

  void drive() {

    xpos = xpos + xspeed; //moving it to the right
    if (xpos > width) {
      xpos = 0;
    }

    ypos = ypos + yspeed; //moving it to the bottom
    if ( ypos > height) {
      ypos = 0;
    }//end of if
  } //edn of drive
} //end of class
