public class Player extends Sprite {
  PImage planeNormal;
  PImage hpDisplay;
  PVector position;
  PVector speed;
  float rotation;
  boolean active;
  int health;
  int size;
  SuperCharge superCharge;

  boolean immune;
  int immuneTimer;
  int immuneDuration;

  public Player() {
    position = new PVector(width/2,height/2);
    speed = new PVector(0, 0);
    health = 3;
    active = true;
    size = 15;
    rotation = 0;
    loadPlayerSprite();
    superCharge = new SuperCharge();
    immune = false;
    immuneTimer = 0;
    immuneDuration = 60;
  }

  void enact(ArrayList<Attack> allAttacks) {
    keyboardUpdate();
    movePlayer();
    displayPlayer();
    handleCollisions(allAttacks);
    superCharge.update();
    superCharge.showBar();
    updateImmunity();
    println(health);
  }

  void loadPlayerSprite() {
    planeNormal = planeNormalImg;
    hpDisplay = hpImg;
    planeNormal.resize(50, 50);
  }

  @Override
  void move(int xCoor, int yCoor) {
    if (!(position.x < -size || position.y < -size || position.x > width + size || position.y > height + size)) {
      position = new PVector(xCoor, yCoor);
    }
  }

  void parry(Projectile proj) {
    proj.setVelocity(-(int)proj.velocity.x, -(int)proj.velocity.y);
    proj.parent = this;
  }

  void keyboardUpdate() {
    if (keyboardInput.P1_LEFT) {
      rotation -= 0.18;
    }
    if (keyboardInput.P1_RIGHT) {
      accelerate();
    }
    if (keyboardInput.P1_SPACE) {
      superCharge.points -= 1;
    }
    image(hpDisplay, 70, height - 110, size * 10 , size * 5);
    fill(0);
    textSize(32);
    textAlign(LEFT, BOTTOM);
    text(health, 90, height - 95);
  }

  void movePlayer() {
    speed.mult(0.99);
    position.add(speed);
    if (position.x < 0) position.x = width;
    if (position.x > width) position.x = 0;
    if (position.y < 0) position.y = height;
    if (position.y > height) position.y = 0;
  }

  void accelerate() {
    PVector force = PVector.fromAngle(rotation).mult(0.3);
    speed.add(force);
    if (speed.mag() > 5) {
      speed.setMag(5);
    }
  }

  void displayPlayer() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(rotation);
    imageMode(CENTER);
    image(planeNormal, 0, 0);
    popMatrix();
  }

  void handleCollisions(ArrayList<Attack> allAttacks) {
    if (immune) return;
    for (int i = allAttacks.size() - 1; i >= 0; i--) {
      Attack atk = allAttacks.get(i);
      if (dist(position.x, position.y, atk.position.x, atk.position.y) < size + atk.size / 2) {
        if (atk instanceof Projectile && keyboardInput.P1_SPACE) {
          if (superCharge.points >= 5) {
            parry((Projectile)atk);
            superCharge.points -= 5;
          } else {
            atk.deactivate();
            health--;
            activateImmunity();
            clearProjectiles(allAttacks);
          }
        } else {
          atk.deactivate();
          health--;
          activateImmunity();
          clearProjectiles(allAttacks);
        }
      }
    }
  }
  void activateImmunity() {
    immune = true;
    immuneTimer = 0;
  }
  void updateImmunity() {
    if (immune) {
      immuneTimer++;
      if (immuneTimer > immuneDuration) {
        immune = false;
      }
    }
  }
  void clearProjectiles(ArrayList<Attack> allAttacks) {
    for (int i = allAttacks.size() - 1; i >= 0; i--) {
      Attack atk = allAttacks.get(i);
      if (atk instanceof Projectile) {
        atk.deactivate();
      }
    }
  }
}
