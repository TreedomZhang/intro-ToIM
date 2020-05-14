**Final Project Draft Proposal**

In this project, I want to create a short game based on one of my previous assignment. Here is the link to that:https://github.com/TreedomZhang/intro-ToIM/tree/master/April7
The previous project mainly includes a bug eating candies and as it eats more, its body will get bigger and the score board will reflect the number of the cadies eaten.

In the future version I want to accomplish four more major points:

1. The color of the bug can be chosen based on the user's preference at the beginning of this game, a color palette will be provided.

2. There will be multiple scenes to make the game more complete: eg. the game openning scene, the color choosing scene, the instruction scene, and the ending scene (include a total record of the score).

3. The position of the bug will be the position of the user's mouth use the video function instead of the position of the mouse.  

There is also one element I want to debug which is after the bug eats one candy, I want that candy to disappear instead of continue to show on the screen. 

**Final Project**

This time I made a game in which a bug was trying to eat candies. If it managed to eat one candy (that is the outside of the square-like candy is included within the bug's head), the radius of the bug's head would get largger showing that it would grow after eating the candy. Also, the position of the bug (that is the center of its head) is decided by the x,y position of the mouse. It moved with the mouse. All the square-like candies would come from the left side of the screen and move with different speed. I created two classes which are "Bar" (candy) and "Bug". I also made the candies into an array. Details can be seen in the codes and comments.

Compared to the original version, I designed three more screens. In the intro screen, you will see the name of the game and instruction "click to play". In the color choosing screen, you can choose a color for your bug and there will be a preview of the color of your bug.
In the original game screen you will play the game. In the end screen, you will see your score and a candy confetti. 

Looking back to my proposal, I finished 2/3 of my goals and I didn't manage to control the position of the mouse by sound or by tracking the user's mouth.

The biggest difficulty I met was to set and save the color a user picked for its bug. Later, I found out that I could only set the color in the mouseClicked function in stead of the color choosing screen (which you only show the preview) because that's when the program knew you picked one color. Also, I don't need to draw a new bug in the mouseClicked function because I have it in the setup already and if I include that the bug will be drawn again and my picked color will be errased. I need to createa color object to the bug.

The good thing about my project is that I make it aesthetically pleasing.

The things I still need to improve is to find a way to make the game more interactive.
