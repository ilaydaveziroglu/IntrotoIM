String A[]={"annemi", "çok", "babamı", "dersime", "yarın", "okula", "anneannemi", "her zaman", "her şey", "ne zaman"};
String B[]={"özledim", "seviyorum", "çalıştım", "gidiyorum", "ziyaret ederim", "selam veririm"};
PFont font;

int colors[]={255, 192, 203, 51, 255, 51, 0, 204, 204};

int countA=10; //word count for the first one
int countB=6; //word count for the second

void setup() {
  size(700, 450);
  font = createFont("Arial", 32 );
  textFont(font, 32);
  fill(0);

  kelime(); //my function
}

void draw() {
  kelime();
  delay(3000);
}


void kelime() {
  int renk = (int)random(0, 3);
  background(colors[renk * 3], colors[renk * 3 + 1], colors[renk * 3 + 2]);
  int numberA = (int)random(0, countA);
  int numberA2 = (int)random(0, countA);
  while (numberA2 == numberA) {
    numberA2 = (int)random(0, countA);
  }
  int numberB = (int)random(0, countB);
  String concat = A[numberA] + "  " + A[numberA2] + "  " + B[numberB]; //putting together my strings
  text(concat, 420-10*concat.length(), 200);
}
