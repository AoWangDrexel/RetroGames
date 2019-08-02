public class Ball {

  private PVector loc;
  private PVector vel;
  private int size;
  private float angle;

  public Ball() {
    respawn();
    size = 20;
  }

  // shows the ball on the screen
  public void display() {
    fill(255);
    noStroke();
    ellipse(loc.x, loc.y, size, size);
  }

  // makes the ball move on screen by adding velocity to location
  public void move() {
    loc.add(vel);
  }

  // edge checking on the top and bottom of the screen
  public void edges() {

    // top or bottom of the screen
    if (loc.y < 0 || loc.y > height) {
      vel.y *= -1;
    }

    // respawn the ball to the middle of the screen
    // if ball goes to the right or left
    if (loc.x > width - right.w) {
      scoreLeft++;
      respawn();
    }
    if (loc.x < left.w) {
      scoreRight++;
      respawn();
    }
  }

  public void respawn() {
    loc = new PVector(width/2, height/2);
    angle = random(-PI/4, PI/4);
    vel = new PVector(5 * cos(angle), 5 * sin(angle));
    if (random(1) < 0.5) {
      vel.x *= -1;
    }
  }
}
