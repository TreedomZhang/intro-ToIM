//reference: "Adafruit Motor Shield V2 Library - Stepper Test" example code, "toneMelody" example code, and pitches.h
#include "pitches.h" // reference pitches.h file
#include <Wire.h>
#include <Adafruit_MotorShield.h>
Adafruit_MotorShield AFMS = Adafruit_MotorShield(); //Create the Adafruit_MotorShield object
Adafruit_StepperMotor *myMotor = AFMS.getStepper(200, 2); //Create the stepper motor object


const int greenLED = 10;
const int redLED = 6;
const int yellowLED = 9;
const int blueLED = 5;
const int potentiometer = A5;
const int buzzer = 7;
const int blueButton = 2;
const int redButton = 3;
const int greenButton = 4; // choose representative variable names and connect to corresponding pins and since they don't change, use "const int"

int importantmelody[] = {
  NOTE_C4, NOTE_D4, NOTE_E4, NOTE_G4, NOTE_E4, NOTE_G4
};                         // importantmelody notes

int importantnoteDurations[] = {
  12, 12, 12, 4, 8, 8
};                        // importantmelody note duration


void doTheBlinking (int whichLED, int delayAmount) {
  digitalWrite (whichLED, HIGH);
  delay(delayAmount);
  digitalWrite (whichLED, LOW);
  delay(delayAmount);
  digitalWrite (whichLED, HIGH);
  delay(delayAmount);
  digitalWrite (whichLED, LOW);
  delay(delayAmount);
  digitalWrite (whichLED, HIGH);
  delay(delayAmount);
  digitalWrite (whichLED, LOW);
  delay(delayAmount);

}                         // create a function "doTheBlinking" so that we can call it every time we want to use it intead of writing it several times

void setup() {
  pinMode (10, OUTPUT);
  pinMode (9, OUTPUT);
  pinMode (5, OUTPUT);
  pinMode (6, OUTPUT);
  pinMode (7, OUTPUT);
  pinMode (A5, INPUT);
  pinMode (2, INPUT);
  pinMode (3, INPUT);
  pinMode (4, OUTPUT);
  pinMode (A4, INPUT);
  Serial.begin(9600);

  AFMS.begin(1600);  // create with the default frequency 1.6KHz
  myMotor->setSpeed(10);  // 10 rpm
}
void loop() {
  int lightSensorValue = analogRead (A4);
  int Potentiometer_val = analogRead(potentiometer);
  int mappedPotentiometer_val = map(Potentiometer_val, 0, 1023, 0, 255);  //A call to analogWrite() is on a scale of 0 - 255

  Serial.print("lightSensorValue = ");
  Serial.println(lightSensorValue); //to print and see the range of light sensor in normal and "people-nearby" situation for further use

  // if lightSensorValue is smaller than 900, meaning someone is near by, than the following blinking and spinning will begin otherwise nothing will happen
  if (lightSensorValue < 900) {
    doTheBlinking (greenLED, 15000 / mappedPotentiometer_val);
    doTheBlinking (yellowLED, 15000 / mappedPotentiometer_val);
    doTheBlinking (redLED, 15000 / mappedPotentiometer_val);
    doTheBlinking (blueLED, 15000 / mappedPotentiometer_val);// the delayAmount can be controlled by the potentiometer, if analogRead of potentiometer is bigger, the delayamount will be smaller, vise versa


    // if we push greenButton, green pen will turn to the front (180 degree clockwise) with the cross carrier
    if (digitalRead(greenButton) == 1) {
      //  Serial.print("HIGH"); I comment this out because I used this to test if greenButton was connect into the circuit when it was not working at the first place
      myMotor->step(100, FORWARD, SINGLE);
      doTheBlinking (greenLED, 20000 / mappedPotentiometer_val);
      delay(4000); // delay 4s
      myMotor->step(100, BACKWARD, SINGLE); // position goes back to original (black pen facing forward)
    }


    // if we push blueButton, blue pen will turn to the front (90 degree counterclockwise) with the cross carrier
    if (digitalRead(blueButton) == 1) {
      myMotor->step(50, BACKWARD, SINGLE);
      doTheBlinking (blueLED, 20000 / mappedPotentiometer_val);
      delay(4000);
      myMotor->step(50, FORWARD, SINGLE);
    }


    // if we push redButton, red pen will turn to the front (90 degree clockwise) with the cross carrier
    if (digitalRead(redButton) == 1) {
      myMotor->step(50, FORWARD, SINGLE);
      doTheBlinking (redLED, 20000 / mappedPotentiometer_val);
      for (int thisNote = 0; thisNote < 6; thisNote++) {            // after redLED blinks, the importantmelody will play
        int importantnoteDuration = 1800 / importantnoteDurations[thisNote];
        tone(buzzer, importantmelody[thisNote], importantnoteDuration);
        int pauseBetweenNotes = importantnoteDuration * 1.30;
        delay(pauseBetweenNotes);
        noTone(buzzer);
      }
      delay(4000);
      myMotor->step(50, BACKWARD, SINGLE);
    }
  }
}
