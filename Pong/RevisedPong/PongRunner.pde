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
      rect(width/2, i * 20, 2, 5);
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


// sections in the paddle ricochets the ball in different angles
public void hitPaddle() {
  if (b.loc.x <= left.loc.x + left.w) {
    if (b.loc.y >= left.loc.y && b.loc.y <= left.loc.y + left.h) {
      if (b.loc.y <= left.loc.y && b.loc.y <= left.loc.y + left.loc.y/8) {
        b.vel.x = 8 * cos(radians(-45));
        b.vel.y = 8 * sin(radians(-45));
      } else if (b.loc.y >= left.loc.y + left.loc.y/8 && b.loc.y <= left.loc.y +  + left.loc.y/4) {
        b.vel.x = 8 * cos(radians(-30));
        b.vel.y = 8 * sin(radians(-30));
      } else if (b.loc.y >= left.loc.y +  + left.loc.y/4 && b.loc.y <= left.loc.y + 3 * left.loc.y/8) {
        b.vel.x = 8 * cos(radians(-15));
        b.vel.y = 8 * sin(radians(-15));
      } else if (b.loc.y >= left.loc.y + 3 * left.loc.y/8 && b.loc.y <= left.loc.y + left.loc.y/2) {
        b.vel.x = 8 * cos(radians(0));
        b.vel.y = 8 * sin(radians(0));
      } else if (b.loc.y >= left.loc.y + left.loc.y/2 && b.loc.y <= left.loc.y + 5 * left.loc.y/8) {
        b.vel.x = 8 * cos(radians(0));
        b.vel.y = 8 * sin(radians(0));
      } else if (b.loc.y >= left.loc.y + 5 * left.loc.y/8 && b.loc.y <= left.loc.y + 3 * left.loc.y/4) {
        b.vel.x = 8 * cos(radians(15));
        b.vel.y = 8 * sin(radians(15));
      } else if (b.loc.y >= left.loc.y + 3 * left.loc.y/4 && b.loc.y <= left.loc.y + 7 * left.loc.y/8) {
        b.vel.x = 8 * cos(radians(30));
        b.vel.y = 8 * sin(radians(30));
      } else {
        b.vel.x = 8 * cos(radians(45));
        b.vel.y = 8 * sin(radians(45));
      }
    }
  }

  if (b.loc.x >= right.loc.x - right.w) {
    if (b.loc.y >= right.loc.y && b.loc.y <= right.loc.y + right.h ) {
      if (b.loc.y <= right.loc.y && b.loc.y <= right.loc.y + right.loc.y/8) {
        b.vel.x = 8 * cos(radians(-135));
        b.vel.y = 8 * sin(radians(-135));
      } else if (b.loc.y >= right.loc.y + right.loc.y/8 && b.loc.y <= right.loc.y +  + right.loc.y/4) {
        b.vel.x = 8 * cos(radians(-150));
        b.vel.y = 8 * sin(radians(-150));
      } else if (b.loc.y >= right.loc.y +  + right.loc.y/4 && b.loc.y <= right.loc.y + 3 * right.loc.y/8) {
        b.vel.x = 8 * cos(radians(-165));
        b.vel.y = 8 * sin(radians(-165));
      } else if (b.loc.y >= right.loc.y + 3 * right.loc.y/8 && b.loc.y <= right.loc.y + right.loc.y/2) {
        b.vel.x = 8 * cos(radians(180));
        b.vel.y = 8 * sin(radians(180));
      } else if (b.loc.y >= right.loc.y + right.loc.y/2 && b.loc.y <= right.loc.y + 5 * right.loc.y/8) {
        b.vel.x = 8 * cos(radians(180));
        b.vel.y = 8 * sin(radians(180));
      } else if (b.loc.y >= right.loc.y + 5 * right.loc.y/8 && b.loc.y <= right.loc.y + 3 * right.loc.y/4) {
        b.vel.x = 8 * cos(radians(165));
        b.vel.y = 8 * sin(radians(165));
      } else if (b.loc.y >= right.loc.y + 3 * right.loc.y/4 && b.loc.y <= right.loc.y + 7 * right.loc.y/8) {
        b.vel.x = 8 * cos(radians(150));
        b.vel.y = 8 * sin(radians(150));
      } else {
        b.vel.x = 8 * cos(radians(135));
        b.vel.y = 8 * sin(radians(135));
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
