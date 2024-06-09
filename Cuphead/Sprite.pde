abstract class Sprite {
  PVector position;
  int health;
  int size;
  boolean active;
  ArrayList<Attack> attackList;

  abstract void enact(ArrayList<Attack> allAttacks);

  void move(int xCoor, int yCoor) {
    position.x += xCoor;
    position.y += yCoor;
  }

  void deactivate () {
    active = false;
  }
}
