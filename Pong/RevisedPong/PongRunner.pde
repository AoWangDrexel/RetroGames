/*
 Author: Ao Wang
 
 Description: Pong is one of the earliest arcade video games. 
 It is a table tennis sports game featuring simple 
 two-dimensional graphics. 
 
 Instructions: The player controls an in-game paddle 
 by moving it vertically across the left or right side
 of the screen. They can compete against another player
 controlling a second paddle on the opposing side.
 Players use the paddles to hit a ball back and forth. 
 */

Ball b;
Paddle left;
Paddle right;
PVector locLeft;
PVector locRight;
PFont eightBit;

String intro;
boolean play;
int scoreLeft;
int scoreRight; 

float angle;
float rad;

void setup() {
  size(800, 500);

  play = false;
  scoreLeft = 0;
  scoreRight = 0;

  // initializing the ball objects
  b = new Ball();

  // placing the paddles at each side
  locLeft = new PVector(20, height/2 - 40);
  locRight = new PVector(width - 40, height/2 - 40);
  left = new Paddle(locLeft);
  right = new Paddle(locRight);
}


void draw() {
  background(0);

  introDisplay();

  if (keyPressed) {
    play = true;
  }
  if (play) {
    background(0);

    scoreDisplay();

    // left and right paddles
    left.display();
    right.display();

    // ball display, movement, and edge detection
    b.display();
    b.move();
    b.edges();

    // paddle ball detection
    hitPaddle();
    controls();

    // dividing line
    for (int i = 0; i < height; i++) {
      rect(width/2, i * 20, 1, 5);
    }
  }
}

// controls of the paddle, when w is pressed, left goes up, s goes down
void controls() {
  if (keyPressed) {
    if (key == 'w') {
      left.move(-10);
    } else if (key == 's') {
      left.move(10);
    } else if (keyCode == UP) {
      right.move(-10);
    } else if (keyCode == DOWN) {
      right.move(10);
    }
  }
}

// if ball hits paddle, ball goes opposite direction
// need to add functionality to the paddle, so different
// section ricochets the ball in different angles
public void hitPaddle() {
  if (b.loc.x < left.loc.x + left.w + 5) {
    if (b.loc.y > left.loc.y && b.loc.y < left.loc.y + left.h) {
      if (b.loc.y > left.loc.y + left.w/2) {
        b.vel.x = 5 * cos(radians(random(-45, 0)));
        b.vel.y = 5 * sin(radians(random(-45, 0)));
      } else {
        b.vel.x = 5 * cos(radians(random(45)));
        b.vel.y = 5 * sin(radians(random(45)));
      }
    }
  }

  if (b.loc.x > right.loc.x - 5) {
    if (b.loc.y > right.loc.y && b.loc.y < right.loc.y + right.h) {
      if (b.loc.y > right.loc.y + right.w/2) {
        b.vel.x = 5 * cos(radians(random(225)));
        b.vel.y = 5 * sin(radians(random(225)));
      } else {
        b.vel.x = 5 * cos(radians(random(135)));
        b.vel.y = 5 * sin(radians(random(135)));
      }
    }
  }
}

// does introduction before the snake game
// old-style font
void introDisplay() {
  background(0);
  // introduction text 
  textAlign(CENTER, CENTER);
  eightBit = createFont("ARCADE.TTF", 1);
  textFont(eightBit);
  intro = "Pong";
  textSize(128);
  text(intro, width/2, height/2 - 90);
  textSize(64);
  intro = "Click any key to start";
  text(intro, width/2, height/2);
  textSize(32);
  intro = "By: Ao Wang";
  text(intro, width/2, height/2 + 70);
}

// shows the score on screen
void scoreDisplay() {
  intro = "Score: " + scoreLeft;
  textSize(32);
  text(intro, width/4, 50);

  intro = "Score: " + scoreRight;
  text(intro, width/2 + width/4, 50);
}
