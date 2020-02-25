#include "pitches.h"
#include <Servo.h>
Servo myservo;
int pos = 0;
int melody[] = {
  NOTE_C4, NOTE_C4, NOTE_C4, 0, NOTE_A3, NOTE_A3, 0, NOTE_B3, NOTE_B3, NOTE_B3, 0, NOTE_F4, NOTE_F4, NOTE_F4, NOTE_F4, 0, NOTE_B4,
  NOTE_C4, NOTE_C4, NOTE_C4,NOTE_C4, 0, NOTE_A3, 0, NOTE_B3, NOTE_B3, NOTE_B3,NOTE_B3, 0, NOTE_F4
};
int noteDurations[] = {
  8, 4, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 4,
  8,4,8,8,8,8,8,8,8,4,8,8,4
};
int potpin = 0;
int val;



void setup() {
  pinMode (12, INPUT);
  pinMode (13,INPUT);
  myservo.attach(9);

}

void loop() {
  int buttonState = digitalRead (12);
  int blueButtonState = digitalRead (13);
  if (buttonState == 1) {
    for (int thisNote = 0; thisNote < 17; thisNote++) {// I didn't count the 0 note
      int noteDuration = 2000 / noteDurations[thisNote];
      tone(8, melody[thisNote], noteDuration);
      int pauseBetweenNotes = noteDuration * 1.30;
      delay(pauseBetweenNotes);
      noTone(8);
    }

    for (pos = 0; pos <= 180; pos += 1) { // goes from 0 degrees to 180 degrees
      // in steps of 1 degree
      myservo.write(pos);              // tell servo to go to position in variable 'pos'
      delay(15);
    }                      // waits 15ms for the servo to reach the position

  }
  
  if (blueButtonState == 1) {
    for (int thisNote = 17; thisNote < 30; thisNote++) {// I didn't count the 0 note
      int noteDuration = 2000 / noteDurations[thisNote];
      tone(8, melody[thisNote], noteDuration);
      int pauseBetweenNotes = noteDuration * 1.30;
      delay(pauseBetweenNotes);
      noTone(8);}
      
       for (pos = 180; pos >= 0; pos -= 1) { // goes from 0 degrees to 180 degrees
      // in steps of 1 degree
      myservo.write(pos);              // tell servo to go to position in variable 'pos'
      delay(15);
    }            
    
  }
  
}
