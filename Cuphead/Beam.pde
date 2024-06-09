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
  }

  public Beam(int xCoor, int yCoor, int Size, int r, boolean parryable) {
    super(xCoor, yCoor, Size);
    this.r = r;
    beamImage = beamPImg;
    this.parryable = parryable;
  }

  void rotate() {
    r += 5;
    if (r > 360) {
      r = 0;
    }
  }

  void rotate(int deltaR) {
    r += deltaR;
    if (r > 360) {
      r = 0;
    }
  }

  void enact() {
    position.x -= 5;
    image(beamImage, position.x, position.y, size * 10, size * 3);
  }
}
