public class Projectile extends Attack {
  float mass;
  PVector velocity;
  PVector gravity = new PVector(0, 10);
  
  public Projectile() {
    super();
    mass = 1;
    velocity = new PVector(0, 0);
  }
  
  public Projectile (int xCoor, int yCoor, int Size, float Mass, int xVe, int yVe) {
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
  
  void applyForce (PVector force) {
    if (mass > 0.0) {
     velocity.add(force.div(mass));
    }
  }
  
  void enact() {
    this.applyForce(gravity);
    this.move((int)(x + velocity.x), (int)(y + velocity.y));
    fill(0);
    circle(x, y, size * 10);
  }
}
