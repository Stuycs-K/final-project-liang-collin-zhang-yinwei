public class Attack {
  int x;
  int y;
  int size;
  boolean active;
  //Sprite parent;
  
  public Attack() {
    x = 0;
    y = 0;
    size = 1;
    active = true;
  }
  
  public Attack(int xCoor, int yCoor, int Size) {
    x = xCoor;
    y = yCoor;
    size = Size;
    active = true;
  }
}
