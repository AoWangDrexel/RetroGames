public class Paddle {
  private PVector loc;
  private int w;
  private int h;

  public Paddle(PVector loc) {
    this.loc = loc;
    w = 20;
    h = 100;
  }

  // shows the paddle on screen
  public void display() {
    fill(255);
    rect(loc.x, loc.y, w, h);
  }

  // moves paddles up or down
  public void move(int dir) {
    loc.y += dir;
    loc.y = constrain(loc.y, 0, height - h);
  }
}
