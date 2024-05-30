public class Boss extends Sprite {
  public Boss () {
    position = new PVector(width, height / 2);
    health = 10;
    size = 0;
    attackList = new ArrayList<Attack>();
    active = true;
    limit = 0; 
  }
  
  
  
  void enact(ArrayList<Attack> allAttacks) {}
}
