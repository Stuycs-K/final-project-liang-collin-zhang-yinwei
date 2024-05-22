public class Attack {
  int x;
  int y;
  int size;
  boolean active;
  int limit;
  //Sprite parent;
  
  public Attack() {
    x = 0;
    y = 0;
    size = 1;
    active = true;
    limit = size * 50; //subject to change 
  }
  
  public Attack(int xCoor, int yCoor, int Size) {
    x = xCoor;
    y = yCoor;
    size = Size;
    active = true;
    limit = size * 50; //subject to change 
  }
  
  void move(int xCoor, int yCoor) {
    x = xCoor;
    y = yCoor;
    if (x < limit * -1 || y < limit * -1 || x > width + limit || y > height + limit) {
      this.deactivate();
    }
  }
  
  void deactivate () {
    active = false;
  }
}
