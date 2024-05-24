public class Projectile extends Attack {
  float mass;
  PVector velocity;
  PVector gravity;
  
  public Projectile() {
    super();
    mass = 1;
    velocity = new PVector(0, 0);
    gravity = new PVector(0, mass);
  }
  
  public Projectile (int xCoor, int yCoor, int Size, float Mass, int xVe, int yVe) {
    super(xCoor, yCoor, Size);
    mass = Mass;
    velocity = new PVector(xVe, yVe);
    gravity = new PVector(0, mass);
  }
  
  void setVelocity(int xVe, int yVe) {
    velocity = new PVector (xVe, yVe);
  }
  
  void shiftVelocity (int deltaX, int deltaY) {
    velocity.add(new PVector(deltaX, deltaY));
  }
  
  void applyForce (PVector force) {
     PVector forceNew = force.copy();
     float diver = mass;
     if (diver == 0) {
       diver = 0.2;
     }
     forceNew.div(diver);
     velocity.add(forceNew);
  }
  
  void enact() {
    this.applyForce(gravity);
    this.move((int)(x + velocity.x), (int)(y + velocity.y));
  }
}
