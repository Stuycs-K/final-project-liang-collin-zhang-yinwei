public class Boss extends Sprite {
  PImage body;
  PImage head;
  
  public Boss () {
    position = new PVector(850, 450);
    health = 10;
    size = 0;
    attackList = new ArrayList<Attack>();
    active = true;
    limit = 300; 
    loadBossSprite();
  }
  
  void attack() {
    
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
    attack();
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
