public class Beam extends Attack{
  int r;
  PImage beamImage;

  public Beam () {
    super();
    r = 0;
    beamImage = beamImg;
  }
  
  public Beam (int xCoor, int yCoor, int Size, int r) {
    super(xCoor, yCoor, Size);
    this.r = r;
    beamImage = beamImg;
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
    fill(255, 0, 0);
    image(beamImage, position.x, position.y, size * 10, size * 3);
  }
}
