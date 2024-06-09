public class Beam extends Attack{
  int r;
  PImage beamImage;
  boolean parryable;

  public Beam () {
    super();
    r = 0;
    beamImage = beamImg;
    parryable = false;
  }
  
  public Beam (int xCoor, int yCoor, int Size, int r) {
    super(xCoor, yCoor, Size);
    this.r = r;
    beamImage = beamImg;
    parryable = false;
    velocity = new PVector(-7, 0);
  }

  public Beam(int xCoor, int yCoor, int Size, int r, boolean parryable) {
    super(xCoor, yCoor, Size);
    this.r = r;
    beamImage = beamPImg;
    this.parryable = parryable;
    velocity = new PVector(-7, 0);
  }
  
  public Beam(int xCoor, int yCoor, int Size, int r, boolean parryable, int xvel, int yvel) {
    super(xCoor, yCoor, Size);
    this.r = r;
    beamImage = beamPImg;
    this.parryable = parryable;
    velocity = new PVector(xvel, yvel);
  }

  void enact() {
    position.x += velocity.x;
    position.y += velocity.y;
    image(beamImage, position.x, position.y, size * 10, size * 3);
  }
}
