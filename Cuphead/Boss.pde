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
    attackList = new ArrayList<Attack>();
    active = true;
    limit = 0; 
    loadBossSprite();
    time = millis();
    rng = new Random();
  }
  
  void attack() {
    float vx = rng.nextFloat() * 50 + 10;
    float vy = rng.nextFloat() * 2;
    Projectile ball = new Projectile((int)position.x + 50, (int)position.y - 150, 50, 5, -(int)vx, (int)vy);
    attackList.add(ball);
  }
  
  void loadBossSprite() {
    body = loadImage("body.png");
    head = loadImage("head.png");
  }
  
  void enact(ArrayList<Attack> allAttacks) {
    for (Attack atk : allAttacks) {
      if (atk.position.x > width - limit) {
        if (! attackList.contains(atk)) {
          health--;
          atk.deactivate();
          atk.parent.attackList.remove(atk);
          allAttacks.remove(atk);
        }
      }
    }
    if (millis() - time > 1000) {
      attack();
      time = millis();
    }
    
    for (Attack atk : attackList) {
      atk.enact();
    }
    showBoss();
  }
  
  void showBoss() {
    image(body, position.x, position.y - 175, body.width / 3.5, body.height / 3.5);
    image(head, position.x, position.y - 375, head.width / 5, head.height / 5);
    fill(0);
    rect(width - limit, 0, limit, height);
  }
}
