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
    beamImage = beamImg;
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
    if (parryable) {
      fill(100, 100, 100);
    } else {
      fill(255, 0, 0);
    }
    image(beamImage, position.x, position.y, size * 10, size * 3);
  }
}
