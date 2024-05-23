public class Beam extends Attack{
  int r; 
  
  public Beam () {
    super();
    r = 0;
  }
  
  public Beam (int xCoor, int yCoor, int Size, int r) {
    super(xCoor, yCoor, Size);
    this.r = r;
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
    //to be implemented
  }
}
