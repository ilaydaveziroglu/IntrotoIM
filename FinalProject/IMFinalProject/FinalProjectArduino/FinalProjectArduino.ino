int inByte = 0;         // incoming serial byte
int buttonPin1 = 2;    // first analog sensor

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

  pinMode(buttonPin1, INPUT);
  establishContact();
}

void loop() {
  // put your main code here, to run repeatedly:
  int buttonVal1 = digitalRead(buttonPin1);
  if (Serial.available() > 0) {
    inByte = Serial.read();
    //Serial.println(i);
    Serial.write(buttonVal1);
  }
}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.print('A');   // send a capital A
    delay(300);
  }
}
