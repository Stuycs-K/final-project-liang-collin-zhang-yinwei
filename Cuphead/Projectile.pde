public class Projectile extends Attack {
  int mass;
  PVector velocity;
  
  public Projectile() {
    super();
    mass = 1;
    velocity = new PVector(0, 0);
  }
  
  public Projectile (int xCoor, int yCoor, int Size, int Mass, int xVe, int yVe) {
    super(xCoor, yCoor, Size);
    mass = Mass;
    velocity = new PVector(xVe, yVe);
  }
  
  void setVelocity(int xVe, int yVe) {
    velocity = new PVector (xVe, yVe);
  }
  
  void shiftVelocity (int deltaX, int deltaY) {
    velocity.add(deltaX, deltaY);
  }
  
  void enact() {
    
  }
}
