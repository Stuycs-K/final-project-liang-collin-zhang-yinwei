abstract class Sprite {
  PVector position;
  int health;
  int size;
  boolean active;

  abstract void enact(ArrayList<Attack> allAttacks);

  void move(int xCoor, int yCoor) {
    position = new PVector (xCoor, yCoor);
    if (position.x < -size || position.y < -size || position.x > width + size || position.y > height + size) {
      this.deactivate();
    }
  }

  void deactivate () {
    active = false;
  }
}
