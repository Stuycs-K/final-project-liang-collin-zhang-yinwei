public class Player extends Sprite {
  boolean parrying;
  int limit;
  SuperCharge superCharge;

  public Player() {
    position = new PVector(width/2,height/2);
    health = 3;
    attackList = new ArrayList<Attack>();
    active = true;
    size = 15;
    limit = 40;
    parrying = false;
    superCharge = new SuperCharge();
  }

  void enact(ArrayList<Attack> allAttacks) {
    image(hpImg, 20, height - 150, 200, 100);
    textSize(50);
    text(health, 140, height - 85);
    move(-6, 0);
    if(keyboardInput.P_SPACE && superCharge.points >= 5) {
      parrying = true;
    }
    if (parrying) {
            image(aimImg, 20, 20, 50, 50);
      showParryPlayer();
      superCharge.points -= 2;
      if (superCharge.points <= 0 || (!keyboardInput.P_SPACE)) {
          parrying = false;
      }
    } else {
      if (keyboardInput.P_LEFT) {
        move(-6,0);
      }
      if (keyboardInput.P_RIGHT) {
         move(10,0);
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
    for (int i = allAttacks.size() - 1; i >= 0; i--) {
      Attack atk = allAttacks.get(i);
      if (atk.position.dist(this.position) < this.limit + atk.size) {
        if ((!attackList.contains(atk)) && atk.active) {
          if (parrying && ((atk instanceof Beam && ((Beam) atk).parryable) || atk instanceof Projectile)) {
            atk.parent.attackList.remove(atk);
            atk.parent = this;
            atk.velocity.x *= -1;
            atk.velocity.y *=  -1;
            this.attackList.add(atk);
          } else {
            health--;
            atk.deactivate();
            atk.parent.attackList.remove(atk);
            allAttacks.remove(atk);
          }
        }
      }
    }
    superCharge.update();
    superCharge.showBar();
  }

  void showParryPlayer() {
    stroke(0, 255, 0);
    fill(0, 255, 0);
    ellipse(position.x, position.y, 120, 60);
    ellipse(position.x - 60, position.y, 30, 60);
    stroke(0);
    fill(33, 244, 85);
    circle(position.x + 30, position.y + 15, 10);
    stroke(0, 255, 0);
    fill(0, 255, 0);
    ellipse(position.x, position.y, 130, 70);
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
