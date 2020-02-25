**Name of the project:**
"Classified Instruction"
**Brief description**
This project contains three major components: 1. Tone speaker; 2. Servo motor; 3.Switches. Generally when I press the yellow button, the tone speaker will produce sounds of Morse Code for "right", and then the servo motor will turn right (clockwise) for 180 degrees. If I press the blue button, the tone speaker will produce sounds of Morse Code for "left", and then the servo motor will turn left (counter-clockwise) for 180 degrees.
More detailedly, the sound for Morse code is achieved by 1. use different pitches to indicate different letter (for example C4 for R and A3 for I), 2. use different duration to indicate whether it's a dot (2000/8) or a dash (2000/4), 3. between each letter there will be a 0 note to indicate pause the duration is the same as a dot.
**Difficulties**
At first the sound was produced as I imagined after examination, I figured out that it's because although I designed the 0 note in the array, I didn't assign a durration in this case should be 2000/8 for it. And when I counted the number of the total individual tone I wanted to make I counted less than I intended. After fix that I was able to play a complete Morse Code.
**Schematic**


**Photo of the project**
