public class Player extends Sprite {
  PImage planeNormal;
  
  public Player() {
    position = new PVector(width/2,height/2);
    health = 3;
    attackList = new ArrayList<Attack>();
    active = true;
    size = 15;
    limit = 10;
    loadPlayerSprite();
  }
  
  void enact(ArrayList<Attack> allAttacks) {
    if (keyboardInput.P1_LEFT) {
      move(1,1);
    }
    if (keyboardInput.P1_RIGHT) {
       move(1,1);
    }
    ellipse(position.x, position.y, size, size);
    showPlayer();
  }

  void loadPlayerSprite() {
      planeNormal = loadImage("plane.png");
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

  void showPlayer() {
      image(planeNormal, position.x, position.y);
  }
}