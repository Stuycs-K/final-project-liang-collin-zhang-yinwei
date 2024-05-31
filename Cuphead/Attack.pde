abstract class Attack {
  PVector position;
  int size;
  boolean active;
  int limit;
  Sprite parent;
  
  public Attack() {
    position = new PVector(0, 0);
    size = 1;
    active = true;
    limit = size * 50; //subject to change 
    parent = new Boss(); //CHANGE
  }
  
  public Attack(int xCoor, int yCoor, int Size) {
    position = new PVector (xCoor, yCoor);
    size = Size;
    active = true;
    limit = size * 50; //subject to change 
    parent = new Boss(); //CHANGE
  }
  
  void move(int xCoor, int yCoor) {
    position = new PVector (xCoor, yCoor);
    if (position.x < limit * -1 || position.y < limit * -1 || position.x > width + limit || position.y > height + limit) {
      this.deactivate();
    }
  }
  
  void deactivate () {
    active = false;
  }
  
  abstract void enact();
}
