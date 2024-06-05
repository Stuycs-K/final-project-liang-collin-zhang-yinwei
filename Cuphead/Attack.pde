abstract class Attack {
  PVector position;
  int size;
  boolean active;
  PVector velocity;
  Sprite parent;

  public Attack() {
    position = new PVector(0, 0);
    size = 1;
    active = true;
    parent = new Boss(); //CHANGE
    velocity = new PVector(0, 0);
  }
  
  public Attack(int xCoor, int yCoor, int Size) {
    position = new PVector (xCoor, yCoor);
    size = Size;
    active = true;
    parent = new Boss(); //CHANGE
    velocity = new PVector(0, 0);
  }

  void move(int xCoor, int yCoor) {
    position = new PVector (xCoor, yCoor);
    if (position.x < -size || position.y < -size || position.x > width + size || position.y > height + size) {
      this.deactivate();
    }
  }

  void deactivate () {
    active = false;
  }
  
  abstract void enact();
}
