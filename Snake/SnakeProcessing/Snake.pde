import java.util.List;
public class Snake {

  private PVector loc;
  private PVector vel;
  private int total;
  private List<PVector> tail;

  public Snake() {
    loc = new PVector(1, 1);
    vel = new PVector(1, 0);
    total = 0;
    tail = new ArrayList<PVector>();
  }

  // draws the snake piece by piece
  public void render() {
    stroke(255);
    // body and tail
    for (int i = 0; i < tail.size(); i++) {
      fill(#388e3c, map(i, 0, tail.size(), 50, 300));
      rect(tail.get(i).x, tail.get(i).y, scale, scale);
    }

    // head of snake
    fill(#388e3c);
    rect(loc.x, loc.y, scale, scale);
  }

  // deletes the last position of the snake and shifts it down the list
  // then continually add the head to the current direction

  // i.e. 0 | 1 | 2 | 3 | 4 |
  // 4 is the head, 0 is the tail, all in between is the body
  // while the snake moves, 0 is removed and the body shifts down
  // then a new head is created at the end
  public void move() {
    if (total > 0) {
      if (total == tail.size() && !tail.isEmpty()) {
        tail.remove(0);
      }  
      tail.add(new PVector(loc.x, loc.y));
    }

    loc.x += vel.x * scale;
    loc.y += vel.y * scale;

    // makes it so that location of snake does not go outside the perimeter
    loc.x = constrain(loc.x, -1, width);
    loc.y = constrain(loc.y, -1, height);
  }

  public void direction(int x, int y) {
    vel.x = x;
    vel.y = y;
  }

  // when the food and snake come to a certain distance, the snake gets longer
  public boolean consume(PVector foodPos) {
    float distance = dist(loc.x, loc.y, foodPos.x, foodPos.y);
    if (distance < 1.5) {
      total++;
      return true;
    }
    return false;
  }

  // game over when the snake eats itself
  public void dead() {
    for (int i = 0; i < tail.size(); i++) {
      float distance = dist(loc.x, loc.y, tail.get(i).x, tail.get(i).y);
      if (distance < 1) {
        total = 0;
        speed = 10;
        tail.clear();
      }
    }
  }
}
