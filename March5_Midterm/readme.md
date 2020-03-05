**Name of the project:**

"Pen Delivery Machine"

**Detail Description**

This project contains two major parts: 1. A cross-like pen delivery machine and 2. The circuit.

*The cross-like pen delivery machine part:

Step 1: A cross-like shape (r = 14cm) was cut out of cardboard. Four smaller rectangular (3cm * 2.5cm) pieces were cut and hotglued to the cross-like shape cardboard as pen holders. 

Step 2: Four pens's caps were hotglued to the four smaller rectangular pieces.

Step 3: A small square (2.5cm * 2.5cm) piece with a small hole in the center was cut and hotglued to the stepper motor through the hole.

Step 4: Use super glue to stick the cross-like shape to the small square piece (which was glued to the stepper motor).

Step 5: Now the pens, the cross-like pen holder, and the stepper motor all move together!

![](hotgluepen.jpg)

![](hotgluesteppermotor.jpg)

*The circuit part:

Three buttons (red, blue, and green) were connected to pin 3,2,4 respectively. Four LEDs (green, yellow, red, and blue) were connected to pin 10,9,6,5. A buzzer was connected to 7. A potentiometer was connected to A5. A light sensor was connected to A4. An Adafruit Motor Shield V2 was connected to the red board and the stepper motor is connected to it like this:

![](midtermprojectredboardpart.jpg)

**How does it work?**

Basically, if someone approach the delivery machine (analogRead of potentiometer is lower than 900), the whole process will start. The LEDs will blink in order (green, yellow, red, blue) and the delay amount (or visually speaking "speed") can be controlled by potentiometer. The default is the black pen facing forward, and if you press the green button, the stepper motor will turn 180 degree clockwise to deliver the green pen and go back to the default position. If the blue button is pressed, the stepper motor will turn 90 degree counterclockwise to deliver the blue pen and go back to the default position. If the red button is pressed, the stepper motor will turn 90 degree clockwise to deliver the red pen, and the buzzer will play some melody to imply that the teacher is using red pen to underline something important and then go back to the default position. 

**Difficulties**

At first the sound was produced as I imagined after examination, I figured out that it's because although I designed the 0 note in the array, I didn't assign a durration in this case should be 2000/8 for it. And when I counted the number of the total individual tone I wanted to make I counted less than I intended. After fix that I was able to play a complete Morse Code.

**Schematic**
![](midtermschematic.jpg)


**Photos of the project**

![](midtermprojectwhole.jpg)

![](midtermprojectmotorpart.jpg)

![](midtermprojectbreadboardpart.jpg)

![](midtermprojectredboardpart.jpg)
