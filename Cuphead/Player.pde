public class Player extends Sprite {
  
  public Player() {
    position = new PVector(width/2,height/2);
    health = 3;
    attackList = new ArrayList<Attack>();
    active = true;
    size = 15;
    limit = 150;
  }
  
  void enact(ArrayList<Attack> allAttacks) {
    if (keyboardInput.P_LEFT) {
      move(-1,0);
    }
    if (keyboardInput.P_RIGHT) {
       move(1,0);
    }
    if(keyboardInput.P_UP) {
      move(0, -1);
    }
    if(keyboardInput.P_DOWN) {
      move(0, 1);
    }
    showPlayer();
  }


  @Override
  void move(int xCoor, int yCoor) {
    position.x += xCoor;
    position.y += yCoor;
  }
  
  void parry() {
    //
  }

  void showPlayer() {
      ellipse(position.x, position.y, 120, 60);
  }
}
