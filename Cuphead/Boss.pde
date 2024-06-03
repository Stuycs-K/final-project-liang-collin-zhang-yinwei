import java.util.Random;

public class Boss extends Sprite {
  int time;
  Random rng;
  
  public Boss () {
    position = new PVector(1100, 450);
    health = 10;
    size = 0;
    attackList = new ArrayList<Attack>();
    active = true;
    limit = 300; 
    time = millis();
    rng = new Random();
  }
  
  Projectile attack() {
    float vx = rng.nextFloat() * 20 + 5;
    float vy = rng.nextFloat() * 2;
    Projectile ball = new Projectile((int)position.x + 50, (int)position.y - 150, 60, 0, -(int)vx, (int)vy);
    attackList.add(ball);
    return ball;
  }
  
  
  void enact(ArrayList<Attack> allAttacks) {
    showBoss();
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
      allAttacks.add(attack());
      time = millis();
    }
    
    for (Attack atk : attackList) {
      atk.enact();
    }
  }
  
  void showBoss() {
    fill(125);
    circle(width - limit / 2, 120, (int)(limit * .75));
    rect(width - limit, 235, limit, height);
    //rect(
  }
}
