import java.util.Random;

public class Boss extends Sprite {
  PImage body;
  PImage head;
  int time;
  Random rng;
  int beamCounter;
  int atkCD;
  Gem gem;

  public Boss () {
    position = new PVector(1300, 600);
    health = 5;
    size = 0;
    active = true;
    loadBossSprite();
    time = millis();
    rng = new Random();
    attackList = new ArrayList<Attack>();
    beamCounter = 0;
    atkCD = 0;
    gem = new Gem();
  }
  
  void attack() {
    if ((int)(rng.nextFloat() * 10) < 2) {
      float vx = rng.nextFloat() * 10 + 10;
      Projectile ball = new Projectile((int)position.x + 100, (int)position.y - 450, 70, 400, -(int)vx, 0, true);
      ball.parent = this;
      allAttacks.add(ball);
      attackList.add(ball);
    }
    atkCD++;
    beamCounter++;
    Beam beam;
    if (beamCounter % 5 == 0) {
      beam = new Beam((int) position.x + 50, (int) position.y - 150, 10, 0, true);
    } else {
      beam = new Beam((int) position.x + 50, (int) position.y - 150, 10, 0);
    }
    beam.parent = this;
    allAttacks.add(beam);
    attackList.add(beam);
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
        allAttacks.remove(i);
      }
    }
    
    for(Attack atk : attackList) {
      atk.enact();
    }

    checkForHits(allAttacks);

    if (millis() - time > 1000) {
      if(atkCD == 0) {
        attack();
      }
      else{
        atkCD--;
      }
      time = millis();
    }

    showBoss();
    
    if(health < 3 && gem.health > 0) {
      gem.enact(allAttacks);
    }
  }

  void showBoss() {
    image(body, position.x + 25, position.y - 155, body.width / 3.5, body.height / 3.5);
    image(head, position.x, position.y - 375, head.width / 5, head.height / 5);
  }

  void checkForHits(ArrayList<Attack> allAttacks) {
    for (int i = allAttacks.size() - 1; i >= 0; i--) {
      Attack atk = allAttacks.get(i);
      if ((atk.parent instanceof Player) && (atk instanceof Projectile)) {
        if (dist(position.x, position.y - 375, atk.position.x, atk.position.y) < size + atk.size / 2 + 100) {
          health--;
          atk.deactivate();
          allAttacks.remove(i);
          atk.parent.attackList.remove(atk);
        }
      }
      else if (atk.parent instanceof Player && atk instanceof Beam) {
        if (atk.position.x >= 1300) {
          health--;
          atk.deactivate();
          allAttacks.remove(i);
          atk.parent.attackList.remove(atk);
        }
      }
    }
  }
}
