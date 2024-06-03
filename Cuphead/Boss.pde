import java.util.Random;

public class Boss extends Sprite {
  PImage body;
  PImage head;
  int time;
  Random rng;
  int hitsTaken;

  public Boss () {
    position = new PVector(1300, 600);
    health = 10;
    size = 0;
    active = true;
    loadBossSprite();
    time = millis();
    rng = new Random();
    hitsTaken = 0;
  }
  
  void attack() {
    if (rng.nextBoolean()) {
      float vx = rng.nextFloat() * 50 + 10;
      float vy = rng.nextFloat() * 2;
      Projectile ball = new Projectile((int)position.x + 100, (int)position.y - 450, 200, 200, -(int)vx, (int)vy);
      ball.parent = this;
      allAttacks.add(ball);
    } else {
      Beam beam = new Beam((int)position.x + 50, (int)position.y - 150, 10, 0);
      beam.parent = this;
      allAttacks.add(beam);
    }
  }

  void loadBossSprite() {
    body = bodyImg;
    head = headImg;
  }

  void enact(ArrayList<Attack> allAttacks) {
    for (int i = allAttacks.size() - 1; i >= 0; i--) {
      Attack atk = allAttacks.get(i);
      if (atk.position.x > width || atk.position.x < 0 || atk.position.y > height || atk.position.y < 0) {
        atk.deactivate();
        atk.deactivate();
        allAttacks.remove(i);
      } else {
        atk.enact();
      }
    }

    checkForHits(allAttacks);

    if (millis() - time > 1000) {
      attack();
      time = millis();
    }

    showBoss();
  }
  
  void showBoss() {
    image(body, position.x + 25, position.y - 155, body.width / 3.5, body.height / 3.5);
    image(head, position.x, position.y - 375, head.width / 5, head.height / 5);
  }

  void takeHit() {
    hitsTaken++;
    if (hitsTaken >= 3) {
      println("Boss is done for");
      exit();
    }
  }

  void checkForHits(ArrayList<Attack> allAttacks) {
    for (int i = allAttacks.size() - 1; i >= 0; i--) {
      Attack atk = allAttacks.get(i);
      if (atk instanceof Projectile && atk.parent instanceof Player) {
        if (dist(position.x, position.y - 375, atk.position.x, atk.position.y) < size + atk.size / 2 + 100) {
          takeHit();
          atk.deactivate();
          allAttacks.remove(i);
        }
      }
    }
  }
}
