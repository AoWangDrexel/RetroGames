/**
 * Author: Ao Wang
 * Title: The Snake Game
 * Description: Snake is the common name for a video game concept where the 
 * player maneuvers a line which grows in length, with the line itself being a 
 * primary obstacle.
 * 
 * Instructions and rules: 
 * The player controls a dot, square, or object on a bordered plane.
 * As it moves forward, it leaves a trail behind, resembling a moving snake.
 * In some games, the end of the trail is in a fixed position, so the snake
 * continually gets longer as it moves. In another common scheme, the snake
 * has a specific length, so there is a moving tail a fixed number of units 
 * away from the head. The player loses when the snake runs into the screen border,
 * a trail or other obstacle, or itself.
 *
 */

Snake s;
PVector food;
PImage imgFood;

// fonts, introduction to the game, and whether the game plays 
PFont eightBit;
String intro;
boolean play;

// array of file names
String [] imgNames = {"apple.png", "pineapple.png", "cherry.png", 
  "banana.png", "grapes.png", "strawberry.png", 
  "dragonfruit.png", "watermelon.png", "lightning.png"};

int scale;
int rand;
int speed;
int highScore;

// add bombs (instant death), poison (subtract from total, makes snake shorter) , slow 
// add speed boost, apples added (maybe add more fruits(create random selection)), 
void setup() {
  size(600, 600);
  s = new Snake();

  // size of items and snake sections
  scale = 30;
  speed = 10;

  highScore = 0;
  play = false;
  pickLoc();
  imgFood = loadImage(imgNames[0]);
}

void draw() {
  introDisplay();
  
  // frame rate of the game, gives the game an old retro feel
  frameRate(speed);

  // if key is pressed, boolean value play turns true
  if (keyPressed) {
    play = true;
  }
  
  // if key pressed, user begins to play
  if (play) {
    background(255);
    fill(0);

    // displays the score and highscore to the screen
    intro = "Score: " + s.total;
    text(intro, 60, 30);
    intro = "Highscore: " + getHighScore(s.total);
    text(intro, 80, 50);

  /*
   * if snake eats item, then a new item will appear randomly
   * if snake eats lightning, the framerate will increase, which makes
   * the same appear to be quicker
   */
    if (s.consume(food)) {
      rand = (int) random(imgNames.length);
      if (imgNames[rand].equals("lightning.png")) {
        speed += 3;
      }
      imgFood = loadImage(imgNames[rand]);
      pickLoc();
    }

    // shows the snake
    s.render();

    // makes the snake move
    s.move();

    // resets snake to size 1
    s.dead();

    stroke(0);
    fill(255);
    image(imgFood, food.x, food.y, scale, scale);

    // make sure snake returns back on screen
    if (s.loc.x == -1) {
      s.loc.x = width ;
    } else if (s.loc.x == width) {
      s.loc.x = 0;
    } else if (s.loc.y == -1) {
      s.loc.y = height;
    } else if (s.loc.y == height) {
      s.loc.y = 0;
    }

    // quit game and print score screen y pressing the key q
    if (keyPressed) {
      if (key == 'q') {
        quitGame();
      }
    }
  }
}

/*
 * aligns the items to the snake by dividing the scale (size of snake) and assigning
 * the item a random square to it, then resizing it 
 */
void pickLoc() {
  int col = width/scale;
  int row = height/scale;
  food = new PVector(floor(random(col)), floor(random(row)));
  food.mult(scale);
}

// gets highest score of all runs
int getHighScore(int score) {
  if (score > highScore) {
    highScore = score;
  }
  return highScore;
}

// controls for the snake 
void keyPressed() {
  if (keyCode == UP) {
    s.direction(0, -1);
  } else if (keyCode == DOWN) {
    s.direction(0, 1);
  } else if (keyCode == RIGHT) {
    s.direction(1, 0);
  } else if (keyCode == LEFT) {
    s.direction(-1, 0);
  }
}

// does introduction before the snake game
// old-style font
void introDisplay() {
  background(0);
  // introduction text 
  textAlign(CENTER, CENTER);
  eightBit = createFont("Minecraft.ttf", 1);
  textFont(eightBit);
  intro = "Snake";
  textSize(64);
  text(intro, width/2, height/2 - 90);
  textSize(32);
  intro = "Click any key to start";
  text(intro, width/2, height/2);
  textSize(20);
  intro = "By: Ao Wang";
  text(intro, width/2, height/2 + 70);
}

// quits game when player hits key q
void quitGame() {
  background(0);
  intro = "SCORE: " + highScore;
  text(intro, width/2, height/2);
  noLoop();
}

// secret cheat, but eh makes the snake longer with every click
void mouseClicked() {
  s.total++;
}
