class Ball {
  private float circleX;
  private float circleY;
  private float size;
  private float xSpeed;
  private float ySpeed;

  Ball(float circleX, float circleY, float size, float xSpeed, float ySpeed) {
    this.circleX = circleX;
    this.circleY = circleY;
    this.size = size;
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;
  }
  // shows ball on screen, whenever ball hits paddle, random color fills in the shapes
  void displayBall() {
    stroke(0);
    if (hitPaddle()) {
      fill(random(255), random(255), random(255));
    }
    ellipse(circleX, circleY, size, size);
  }

  void setPosX(float circleX) {
    this.circleX = circleX;
  }

  float getPosX() {
    return circleX;
  }

  void setPosY(float circleY) {
    this.circleY = circleY;
  }

  float getPosY() {
    return circleY;
  }

  void setSize(float size) {
    this.size = size;
  }

  float getSize() {
    return size;
  }

  void setXSpeed(float xSpeed) {
    this.xSpeed= xSpeed;
  }

  float getXSpeed() {
    return xSpeed;
  }

  void setYSpeed(float ySpeed) {
    this.ySpeed= ySpeed;
  }

  float getYSpeed() {
    return ySpeed;
  }

  // keeps the ball inside the screen if goes beyond the right, top, or bottm
  boolean hitsBorders() {
    if (circleX > width) {
      xSpeed *= -1;
      return true;
    }
    if (circleY  > height || circleY < 0) {
      ySpeed *= -1;
      return true;
    }
    return false;
  }

  // ball returns back when ball hits paddle
  // 15 is the border because 5px is when the paddle is drawn from with the length of 10
  // mouseY - 75 + 100 because of the centering paddle issue, and 100 is the length of the paddle
  boolean hitPaddle() {
    if (circleX <= 15 && circleY < mouseY - 75 + 100 && circleY > mouseY - 75) {
      xSpeed *= -1;
      ySpeed *= -1;
      return true;
    }
    return false;
  }
  // stops the game
  boolean endGame() {
    if (circleX < 0) {
      noLoop();
      return true;
    }
    return false;
  }

  void moveBall() {
    circleX += xSpeed;
    circleY += ySpeed;
  }
}
