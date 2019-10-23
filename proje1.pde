PImage img1; 
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;


void setup() {
  size(1000, 1000);
  background(255);

  img1 = loadImage("image1.jpg");
  img2 = loadImage("image2.jpg");
  img3 = loadImage("image3.png");
  img4 = loadImage("image4.png");
  img5 = loadImage("image5.jpg");
  img6 = loadImage("image6.jpg");
}

void draw() {

  //ellipse(mouseX, mouseY, 10, 10)
  if (  millis() > 1000) {
    image(img1, 0, 0, img1.width/2, img1.height/2);
  }
  if (  millis() > 2000) {
    image(img2, 0, 0, img2.width/2, img2.height/2);
  }
  if (  millis() > 3000) {
    image(img3, 0, 0, img3.width/2, img3.height/2);
  }
  if (  millis() > 4000) {
    image(img4, 0, 0, img4.width/2, img4.height/2);
  }
  if (  millis() > 5000) {
    image(img5, 0, 0, img5.width/2, img5.height/2);
  }
  if (  millis() > 6000) {
    image(img6, 0, 0, img6.width/2, img6.height/2);
  }
}
