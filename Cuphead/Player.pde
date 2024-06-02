public class Player extends Sprite {
  PImage planeNormal;
  PVector position;
  PVector speed;
  float rotation;
  boolean active;
  int health;
  int size;
  int limit;
  ArrayList<Attack> attackList;

  public Player() {
    position = new PVector(width/2,height/2);
    speed = new PVector(0, 0);
    health = 3;
    attackList = new ArrayList<Attack>();
    active = true;
    size = 15;
    limit = 10;
    rotation = 0;
    loadPlayerSprite();
  }

  void enact(ArrayList<Attack> allAttacks) {
    keyboardUpdate();
    movePlayer();
    displayPlayer();
  }

  void loadPlayerSprite() {
    planeNormal = loadImage("plane.png");
    planeNormal.resize(50, 50);
  }

  @Override
  void move(int xCoor, int yCoor) {
    if (!(position.x < limit * -1 || position.y < limit * -1 || position.x > width + limit || position.y > height + limit)) {
       position = new PVector (xCoor, yCoor);
    }
  }
  
  void parry() {
    //
  }

  void keyboardUpdate() {
    if (keyboardInput.P1_LEFT) {
      rotation -= 0.18;
    }
    if (keyboardInput.P1_RIGHT) {
      accelerate();
    }
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
}
