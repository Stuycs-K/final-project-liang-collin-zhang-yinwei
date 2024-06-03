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
    if(keyboardInput.P_SPACE) {
      parry();
      showAltPlayer();
    }
    else{
      if (keyboardInput.P_LEFT) {
        move(-4,0);
      }
      if (keyboardInput.P_RIGHT) {
         move(4,0);
      }
      if(keyboardInput.P_UP) {
        move(0, -4);
      }
      if(keyboardInput.P_DOWN) {
        move(0, 4);
      }
      showPlayer();
    }
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
    stroke(255, 0, 0);
    fill(255, 0, 0);
    ellipse(position.x, position.y, 120, 60);
    ellipse(position.x - 60, position.y, 30, 60);
    fill(236, 227, 192);
    stroke(236, 227, 192);
    circle(position.x + 30, position.y - 30, 40);
    stroke(0);
    fill(33, 244, 85);
    circle(position.x + 30, position.y + 15, 10);
  }
  
  void showAltPlayer() {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    ellipse(position.x, position.y, 120, 60);
    ellipse(position.x - 60, position.y, 30, 60);
    stroke(0);
    circle(position.x + 30, position.y + 15, 10);
  }
}
