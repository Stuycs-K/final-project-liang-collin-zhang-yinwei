abstract class Sprite {
  PVector position;
  int health;
  int size;
  ArrayList<Attack> attackList;
  boolean active;
  int limit;
  
  abstract void enact();
  
  void move(int xCoor, int yCoor) {
    position = new PVector (xCoor, yCoor);
    if (position.x < limit * -1 || position.y < limit * -1 || position.x > width + limit || position.y > height + limit) {
      this.deactivate();
    }
  }
  
  void deactivate () {
    active = false;
  }
}
