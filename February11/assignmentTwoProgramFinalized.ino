/*
  DigitalReadSerial

  Reads a digital input on pin 2, prints the result to the Serial Monitor

  This example code is in the public domain.

  http://www.arduino.cc/en/Tutorial/DigitalReadSerial
*/

// digital pin 2 has a pushbutton attached to it. Give it a name:
int pushButton = 9;

// the setup routine runs once when you press reset:
void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  // make the pushbutton's pin an input:
  pinMode(9, INPUT);
  pinMode(7, OUTPUT);
  pinMode(13, OUTPUT);
  pinMode(8, OUTPUT);
}

// the loop routine runs over and over again forever:
void loop() {

  // read the input pin:
  int buttonState = digitalRead(pushButton);

  if (buttonState == 0)
  {
    digitalWrite(13, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(800);
    digitalWrite(13, LOW);    // turn the LED off by making the voltage LOW
    delay(100);
    digitalWrite(7, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(250);
    digitalWrite(7, LOW);    // turn the LED off by making the voltage LOW
    delay(100);
    digitalWrite(8, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(800);                       // wait for a second
    digitalWrite(8, LOW);    // turn the LED off by making the voltage LOW
    delay(100);
  }

  if (buttonState == 1) {
    digitalWrite(13, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(60);
    digitalWrite(13, LOW);    // turn the LED off by making the voltage LOW
    delay(10);
    digitalWrite(7, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(60);
    digitalWrite(7, LOW);    // turn the LED off by making the voltage LOW
    delay(10);
    digitalWrite(8, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(15);                       // wait for a second
    digitalWrite(8, LOW);
  }

}
