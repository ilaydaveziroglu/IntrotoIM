// We control which screen is active by settings / updating
// gameScreen variable. We display the correct screen according
// to the value of this variable.
// 0: Initial Screen
// 1: Game Screen
// 2: Game-over Screen 

// game screen
int gameScreen = 0;
int[] colors = {255, 0};


//Arduino
import processing.serial.*;
Serial myPort;
int serialIn;
boolean firstContact = false;        // Whether we've heard from the microcontroller


//processing updates
boolean updateScore = false; 
boolean updateLives = false; 

//timing
int up_start_time;
int down_start_time;
int up_wait_time;
int down_wait_time;

//scoring
int score = 0;
boolean up = false;
boolean alreadyScored = false; 
boolean alreadyPressed = false; 
int lives = 3;
int maxLives = 3;

//images
PImage image1;
PImage image2;
PImage image3;
PImage image4;

boolean backgroundSet = false; //background is not set


/********* SETUP BLOCK *********/

void setup() {
  rectMode(CENTER); 
  fullScreen();
  image1 = loadImage("/Users/ilaydaveziroglu/Desktop/IMFinalProject/images/guaki1.png");
  image2 = loadImage("/Users/ilaydaveziroglu/Desktop/IMFinalProject/images/guaki2.png");
  image3 = loadImage("/Users/ilaydaveziroglu/Desktop/IMFinalProject/images/cryingguac.png");
  image4 = loadImage("/Users/ilaydaveziroglu/Desktop/IMFinalProject/images/guaki2.png");
  String portName = Serial.list()[3];
  myPort = new Serial(this, portName, 9600);
}

/********* DRAW BLOCK *********/

void draw() {
  // Display the contents of the game screen
  if (gameScreen == 0) {
    initScreen();
  } else if (gameScreen==1) {
    if (backgroundSet == false) { //if background set is false draw the background
      background(102, 204, 0);
      fill(255);
      rectMode(CENTER);
      strokeWeight(4);
      rect(width/2, 30, 200, 40); //score board
      fill(0);
      textAlign(CENTER);
      text("Score = "+score, width/2, 40);
      fill(255);
      rectMode(CENTER);
      strokeWeight(4);
      rect(width/2, height-60, 200, 40); //lives board
      fill(0);
      textAlign(CENTER);
      text("Lives = "+lives, width/2, height-50);
      fill(255);
      strokeWeight(4);
      ellipse(width/2, height/2, 400, 400); // the circle in the middle
      down_start_time = millis();
      down_wait_time = int(random(1000, 3000));
      backgroundSet = true; //signifies that the background is set
    } 

    //after the backgorund is set, include the functions

    processUpdates();
    game();
  } else if (gameScreen == 2) {
    gameOverScreen(); //if you die, change to game screen 2 which is game over screen
  }
}

/********* SCREEN CONTENTS *********/

//game screen zero contents, the drawings, the title and the instructions
void initScreen() { 
  background(102, 204, 0);
  fill(0, 100, 0);
  textAlign(LEFT);
  textSize(80);
  // textFont(Times New Roman);
  text("Whac-A-Mole:", 60, height/3 -50);
  textSize(80);
  text("Guacamole Edition ", 60, height/3+50);
  textSize(20);
  fill(0);
  textAlign(CENTER);
  text("Press the button to start", width/2, height-30);
  imageMode(CORNER);
  image(image1, width*2/3-100, 80, 500, 700);
  String s = "Try to catch the guacamole bowl by pressing the button whenever it pops out of the hole. You have three lives in total and if you press the button when the guacamole bowl is down in the hole, you will use one of your lives.";
  fill(0);
  textSize(15);
  textAlign(LEFT);
  rectMode(CORNER);
  text(s, 60, 500, 600, 500);  // Text wraps within text box
}

//contents of game over screen which game screen 2, the drawings, the score

void gameOverScreen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(110);
  text("Your Score", width/2, height/2 - 120); 
  textSize(90);
  text(score, width/2, height/2); //print the final score
  textSize(20);
  text("Press to Restart", width/2, height-30);
  imageMode(CENTER);
  image(image3, width/2, height-230, 500, 500);
}

/********* OTHER FUNCTIONS *********/
void processUpdates() {
  if (updateScore) { //to prevent double score
    score(); 
    updateScore = false;
  }
  if (updateLives) { //to prevent double kill
    decreaseLives();
    updateLives = false;
  }
}

void game() {
  if (up) { //up signifies the guacamole picture
    if ( millis()- up_start_time > up_wait_time) {
      changeColor(); 
      down_wait_time = int(random(1000, 3000)); 
      down_start_time = millis();
    }
  } else { //if the guacamole picture is not present, the current state is down
    if (millis() - down_start_time > down_wait_time) {
      changeColor();
      up_wait_time = int(random(max(300-score*10, 100), max(500-score*10, 200))); //the game will get faster and faster, resulting in the game being harder
      up_start_time = millis();
    }
  }
}

// This method sets the necessary variables to start the game  
void startGame() {
  gameScreen=1; 
}

void gameOver() {
  gameScreen=2;
}

void restart() { 
  score = 0; //restart scores
  lives = maxLives; //restart lives
  background(255);
  gameScreen = 0;
  initScreen(); //game screen zero
  backgroundSet= false; //backgroundset is back to false so in the draw function we will redraw and the screens won't overlap
}

void changeColor() {
  up = !up;
  if (up) { //if its up show the picture
    imageMode(CENTER);
    image(image4, width/2, height/2, 400, 400);
  } else { //no picture
    fill(255);
    strokeWeight(4);
    ellipse(width/2, height/2, 400, 400);
  }
  alreadyScored = false;
}

void score() {
  score++;
  fill(255);
  rectMode(CENTER);
  strokeWeight(4);
  rect(width/2, 30, 200, 40);
  fill(0);
  textAlign(CENTER);
  text("Score = "+score, width/2, 40);
  changeColor();   //force changeColor() to signify down
  down_start_time = millis();
}

void decreaseLives() {
  lives -= 1;
  fill(255);
  rectMode(CENTER);
  strokeWeight(4);
  rect(width/2, height-60, 200, 40);
  fill(0);
  textAlign(CENTER);
  text("Lives = "+lives, width/2, height-50);
  if (lives <= 0) { //if you lose all your lives and you reach zero, the game finishes
    gameOver();
  }
}
//Talking to Arduino
void serialEvent(Serial myPort) { 
  // read a byte from the serial port:
  int inByte = myPort.read();
  if (firstContact == false) {
    if (inByte == 'A') {
      myPort.clear();          // clear the serial port buffer
      firstContact = true;     // you've had first contact from the microcontroller
      myPort.write('A');       // ask for more
    }
  } else {
    if (inByte==1 && !alreadyPressed) {
      alreadyPressed = true; //to only read the first byte and ignore the others until there is a change again
      if (gameScreen == 0) {
        startGame();
      } else if (gameScreen == 1) {
        if (up) {
          if (!alreadyScored) {
            updateScore = true; //change the score
            alreadyScored = true; //prevent double score
          }
        } else { 
          updateLives = true; //change the lives 
        }
      } else if (gameScreen == 2) {
        restart();
      }
    } else if (inByte == 0) {
      alreadyPressed = false;
    }
    // Send a capital A to request new sensor readings:
    myPort.write('A');
  }
}
