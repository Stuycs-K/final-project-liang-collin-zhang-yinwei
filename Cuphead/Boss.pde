public class Boss extends Sprite {
  public Boss () {
    position = new PVector(width, height / 2);
    health = 10;
    size = 0;
    attackList = new ArrayList<Attack>();
    active = true;
    limit = 300; 
  }
  
  void attack() {
    
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
    fill(0);
    rect(width - limit, 0, limit, height);
  }
}
