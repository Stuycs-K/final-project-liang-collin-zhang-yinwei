public class Player extends Sprite {
  void enact () {
    if (keyboardInput.P1_LEFT) {
      move(1,1);
    }
    if (keyboardInput.P1_RIGHT) {
       move(1,1);
    }
  }
  
  @Override
  void move(int xCoor, int yCoor) {
    position = new PVector (xCoor, yCoor);
    if (position.x < limit * -1 || position.y < limit * -1 || position.x > width + limit || position.y > height + limit) {
      this.deactivate();
    }
  }
  
  void parry() {
    
  }
  
}
