Boss boss;
ArrayList<Attack> allAttacks;

void setup() {
  keyboardInput = new KeyboardBuffer();
  size(1536, 700);
  allAttacks = new ArrayList<Attack>();
  boss = new Boss();
}

void draw() {
  background(255);
  boss.enact(allAttacks);

  if (keyboardInput.P1_LEFT) {
    rect(10, 10, 10, 10);
  }
  if (keyboardInput.P1_RIGHT) {
    rect(30, 10, 10, 10);
  }
  if (keyboardInput.P1_SPACE) {
    rect(20, 20, 10, 10);
  }
}
