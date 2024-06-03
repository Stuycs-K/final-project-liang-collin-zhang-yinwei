public class Player extends Sprite {
  boolean parrying;
  public Player() {
    position = new PVector(width/2,height/2);
    health = 3;
    attackList = new ArrayList<Attack>();
    active = true;
    size = 15;
    limit = 40;
    parrying = false;
  }
  
  void enact(ArrayList<Attack> allAttacks) {
    move(-3, 1);
    if(keyboardInput.P_SPACE) {
      parrying = true;
      showAltPlayer();
    }
    else{
      if (keyboardInput.P_LEFT) {
        move(-9,0);
      }
      if (keyboardInput.P_RIGHT) {
         move(9,0);
      }
      if(keyboardInput.P_UP) {
        move(0, -6);
      }
      if(keyboardInput.P_DOWN) {
        move(0, 6);
      }
      showPlayer();
    }
    for (Attack atk : attackList) {
      atk.enact();
    }
    for (Attack atk : allAttacks) {
      if (atk.position.dist(this.position) < this.limit + atk.size) {
        if ((!attackList.contains(atk)) && atk.active) {
          if(parrying) {
            atk.parent.attackList.remove(atk);
            atk.parent = this;
            atk.velocity.x *= -1;
            this.attackList.add(atk);
          }
          else{
            health--;
            atk.deactivate();
            atk.parent.attackList.remove(atk);
          }
        }
      }
    }
    parrying = false;
  }


  @Override
  void move(int xCoor, int yCoor) {
    position.x += xCoor;
    position.y += yCoor;
  }
  

  void showPlayer() {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    ellipse(position.x, position.y, 120, 60);
    ellipse(position.x - 60, position.y, 30, 60);
    fill(236, 227, 192);
    stroke(236, 227, 192);
    circle(position.x + 30, position.y - 30, 40);
    stroke(249, 249, 86);
    fill(249, 249, 86);
    if(health >= 1) {
      circle(position.x - 30, position.y + 15, 10);
    }
    if(health >= 2) {
      circle(position.x - 19, position.y + 15, 10);
    }
    if (health >= 3) {
      circle(position.x - 8, position.y + 15, 10);
    }
    stroke(0);
    fill(33, 244, 85);
    circle(position.x + 30, position.y + 15, 10);
  }
  
  void showAltPlayer() {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    ellipse(position.x, position.y, 120, 60);
    ellipse(position.x - 60, position.y, 30, 60);
    stroke(0);
    circle(position.x + 30, position.y + 15, 10);
  }
}
