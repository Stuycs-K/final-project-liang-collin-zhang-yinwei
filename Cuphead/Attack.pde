abstract class Attack {
  PVector position;
  int size;
  boolean active;
  Sprite parent;

  public Attack() {
    position = new PVector(0, 0);
    size = 1;
    active = true;
    parent = new Boss(); //CHANGE
  }
  
  public Attack(int xCoor, int yCoor, int Size) {
    position = new PVector (xCoor, yCoor);
    size = Size;
    active = true;
    parent = new Boss(); //CHANGE
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
