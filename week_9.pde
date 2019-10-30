void setup() {
  size (400, 500);
  background(255);
  smooth();

  noFill();
  rect(20, 20, 360, 460);
  
 
  for ( int i=0; i < 10; i++) {
   float x = random(20,380);
    float y = random(20,480);
    float radius = random(30,120);
    println("x =" + x + "y=" + y);
  
    pushMatrix();
    translate(x, y);
    noFill();
    ellipse(0, 0,radius*2, radius*2);
    popMatrix();
    
  }
}
