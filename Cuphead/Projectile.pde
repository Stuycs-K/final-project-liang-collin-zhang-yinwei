public class Projectile extends Attack {
  float mass;
  PVector velocity;
  PVector gravity;
  boolean bounce;
  
  public Projectile() {
    super();
    mass = 1;
    velocity = new PVector(0, 0);
    gravity = new PVector(0, mass);
    bounce = false;
  }
  
  public Projectile (int xCoor, int yCoor, int Size, float Mass, int xVe, int yVe) {
    super(xCoor, yCoor, Size);
    mass = Mass;
    velocity = new PVector(xVe, yVe);
    gravity = new PVector(0, mass);
  }
  
  public Projectile (int xCoor, int yCoor, int Size, float Mass, int xVe, int yVe, boolean bounce) {
    super(xCoor, yCoor, Size);
    mass = Mass;
    velocity = new PVector(xVe, yVe);
    gravity = new PVector(0, mass);
    this.bounce = bounce;
  }
  
  void setVelocity(int xVe, int yVe) {
    velocity = new PVector (xVe, yVe);
    bounce = false;
  }
  
  void shiftVelocity (int deltaX, int deltaY) {
    velocity.add(new PVector(deltaX, deltaY));
  }
  
  void applyForce (PVector force) {
     PVector forceNew = force.copy();
     float diver = mass;
     if (diver == 0) {
       diver = 1;
     }
     forceNew.div(diver);
     velocity.add(forceNew);
  }
  
  public void bounce() {
    if (y < size)
      velocity.y = abs(velocity.y);
    if (y > height-size)
      velocity.y=-1*abs(velocity.y);
    if (mass > 0.0) {
     //velocity.add(force.div(mass));
    }
  }
  
  void enact() {
    this.applyForce(gravity);
    this.move((int)(x + velocity.x), (int)(y + velocity.y));
    if(bounce) {
      this.bounce();
    }
    ellipse(x, y, size, size);
    fill(0);
    circle(x, y, size * 10);
  }
}
