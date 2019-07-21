Ball b;
boolean play = false;
int score = 0;

void setup() { 
  size(640, 360);
  // creates a ball object that starts in the middle of the screen
  // size 15px, x speed, y speed: 10
  b = new Ball(width/2, height/2, 15, 10, 10);
}

void draw() {
  background(0);
  // introduction text 
  String intro = "Welcome to Pong!";
  textSize(64);
  text(intro, 50, 100);
  textSize(32);
  intro = "Click any key to start :)";
  text(intro, 140, 180);
  textSize(20);
  intro = "By: Ao Wang";
  text(intro, 250, 250);
  
  // if key is pressed, boolean value play turns true
  if (keyPressed) {
    play = true;
  }
  // if key pressed, user begins to play
  if (play) {
    
    // counts the score each time ball hits the paddle
    if (b.hitPaddle()) {
      score++;
    }
    background(0);
    // updates the user the of present number of hits
    textSize(20);
    intro = "Hits: " + score;
    text(intro, 40, 30);
    
    // the paddle, mouseY - 75 ensures control from the middle of the mouse
    // and not from the edge
    rect(5, mouseY - 75, 10, 100);
  
    b.displayBall();
    b.hitsBorders();
    b.moveBall();
    b.hitPaddle();
  }
  // if ball goes beyond the left side, game ends and score is displayed
  if (b.endGame()) {
    background(0);
    intro = "SCORE: " + score;
    text(intro, 270, 180);
  }
}
