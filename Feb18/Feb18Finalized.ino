int RED = 11;
int GREEN = 8;


void setup() {
  pinMode (11, OUTPUT);
  pinMode (8, OUTPUT);
  pinMode (A3, INPUT);
  pinMode (7, INPUT);
  pinMode (A2, INPUT);
  Serial.begin(9600);
}

void loop() {
  int buttonState = digitalRead (7);// Why does it make such a huge difference to include the int buttonState ans int sensorValue in the loop?
  int sensorValue = analogRead(A3);
  int lightValue = analogRead (A2);
  int mappedLight = map(lightValue, 400, 800, 0, 255); // What makes the difference if the lightValue is mapped or not??? Will it be different if this int is put into the loop???

  if (buttonState == 0) {
    doTheBlinking (RED, sensorValue / 10);
    //delay (20);
    doTheBlinking (GREEN, sensorValue / 10);
    //delay (50);
  }
  if (buttonState == 1) {
    Serial.print (lightValue);
    Serial.print("\n");
    analogWrite (RED, mappedLight);// analogWrite only write 0-225
    analogWrite (GREEN, mappedLight);

  }
  /*Serial.print("button = ");
    Serial.println(buttonState);
    Serial.print("potentiometer = ");
    Serial.println(sensorValue);*/
}

void doTheBlinking (int whichLED, int delayAmount) {
  digitalWrite (whichLED, HIGH);
  delay(delayAmount);
  digitalWrite (whichLED, LOW);
  delay(delayAmount);
  digitalWrite (whichLED, HIGH);
  delay(delayAmount);
  digitalWrite (whichLED, LOW);
  delay(delayAmount);
}
