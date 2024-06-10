public class Gem extends Sprite{
  int time;
  int rot;
  public Gem () {
    position = new PVector (1400, 350);
    health = 1;
    size = 15;
    attackList = new ArrayList<Attack>();
    time = millis();
    rot = 0;
  }
  
  void enact(ArrayList<Attack> allAttacks) {
    if (position.x > 750) {
      position.x -= 5;
    }
    else {
      if (millis() - time > 1000) {
        attack();
        time = millis();
      }
      
      for (Attack atk : attackList) {
        atk.enact();
      }
      
      for (int i = allAttacks.size() - 1; i >= 0; i--) {
        Attack atk = allAttacks.get(i);
        if (atk.parent instanceof Player) {
          if (PVector.dist(atk.position, position) < 30) {
            health--;
            atk.deactivate();
            allAttacks.remove(i);
            atk.parent.attackList.remove(atk);
          }
        }
      }
      //check for hits
    }
    
    circle(position.x, position.y, size);//image display here
  }
  
  void attack() {
    rot++;
    if (rot % 2 == 0) {
      Beam b1 = new Beam((int)(position.x), (int)(position.y), 10, 0, true, -7, 0);
      b1.parent = this;
      attackList.add(b1);
      allAttacks.add(b1);
      Beam b2 = new Beam((int)(position.x), (int)(position.y), 10, 0, true, 7, 0);
      b2.parent = this;
      attackList.add(b2);
      allAttacks.add(b2);
      Beam b3 = new Beam((int)(position.x), (int)(position.y), 10, 0, true, 0, -7);
      b3.parent = this;
      attackList.add(b3);
      allAttacks.add(b3);
      Beam b4 = new Beam((int)(position.x), (int)(position.y), 10, 0, true, 0, 7);
      b4.parent = this;
      attackList.add(b4);
      allAttacks.add(b4);
    }
    else {
      Beam b1 = new Beam((int)(position.x), (int)(position.y), 10, 0, true, 5, 5);
      b1.parent = this;
      attackList.add(b1);
      allAttacks.add(b1);
      Beam b2 = new Beam((int)(position.x), (int)(position.y), 10, 0, true, -5, 5);
      b2.parent = this;
      attackList.add(b2);
      allAttacks.add(b2);
      Beam b3 = new Beam((int)(position.x), (int)(position.y), 10, 0, true, 5, -5);
      b3.parent = this;
      attackList.add(b3);
      allAttacks.add(b3);
      Beam b4 = new Beam((int)(position.x), (int)(position.y), 10, 0, true, -5, -5);
      b4.parent = this;
      attackList.add(b4);
      allAttacks.add(b4);
    }
  }
}
