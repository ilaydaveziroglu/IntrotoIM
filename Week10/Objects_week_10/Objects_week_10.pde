Box myBox1;
Box myBox2;

void setup() {
  size(300, 300);
  myBox1 = new Box(color(255, 0, 0), 150, 150, 0, 2);
  myBox2 = new Box(color(0, 0, 255), 150, 150, 2, 0);
}

void draw() {
  background(255);
  myBox1.drive();
  myBox1.display();
  myBox2.drive();
  myBox2.display();
}

class Box {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;

  Box(color tempC, float tempXpos, float tempYpos, float tempXspeed, float tempYspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    yspeed = tempYspeed;
  }

  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos, ypos, 20, 10);
  }

  void drive() {

    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }

    ypos = ypos + yspeed;
    if ( ypos > height) {
      ypos = 0;
    }
  }
}
