import java.util.Random;

public class Boss extends Sprite {
  PImage body;
  PImage head;
  int time;
  Random rng;
  
  public Boss () {
    position = new PVector(1100, 450);
    health = 10;
    size = 0;
    active = true;
    loadBossSprite();
    time = millis();
    rng = new Random();
  }
  
  void attack() {
    float vx = rng.nextFloat() * 50 + 10;
    float vy = rng.nextFloat() * 2;
    Projectile ball = new Projectile((int)position.x + 50, (int)position.y - 150, 50, 5, -(int)vx, (int)vy);
    Beam beam = new Beam((int)position.x + 50, (int)position.y - 150, 10, 0);
    ball.parent = this;
    beam.parent = this;
    allAttacks.add(ball);
    allAttacks.add(beam);
  }

  void loadBossSprite() {
    body = loadImage("body.png");
    head = loadImage("head.png");
  }

  void enact(ArrayList<Attack> allAttacks) {
    for (Attack atk : allAttacks) {
      if (atk.position.x > width || atk.position.x < 0 || atk.position.y > height || atk.position.y < 0) {
        atk.deactivate();
        allAttacks.remove(atk);
      } else {
        atk.enact();
      }
    }
    if (millis() - time > 1000) {
      attack();
      time = millis();
    }

    showBoss();
  }
  
  void showBoss() {
    image(body, position.x, position.y - 175, body.width / 3.5, body.height / 3.5);
    image(head, position.x, position.y - 375, head.width / 5, head.height / 5);
  }
}
