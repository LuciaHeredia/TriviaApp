# GUESS THE FLAG - TriviaApp

Project in an app development course. <br />
The app is a trivia game where the player needs to guess the country name of the flag.<br />
<br />

<img src = "ReadMe Images/homescreen.png" height="580"> <img src = "ReadMe Images/gamescreen.png" height="580">

## App description:
The app contains two screens.<br />
In the Home screen we can see the Top score which is saved and restored when opening the app.<br />
Taping on START leads to the Game screen.<br />
In the Game screen, we have:
 - a progress bar for the questions completed.<br />
 - the number of the question and the total number of questions.<br />
 - number of LIVES left.<br />
 - the image with the flag.<br />
 - the current score.<br />
 - 4 answers.<br />

A correct answer adds a point to the score. A wrong answer decreases the number of LIVES by one.<br />
If there are no more LIVES to use or we reached the last question, a message appears letting us know if we beat the Top score or not.<br />
If we did beat the Top score, when returning to the Home screen we will see it there. <br />

The app uses Firebase Storage, which stores:
- all the images.
- a Json file with all the questions and answers.
