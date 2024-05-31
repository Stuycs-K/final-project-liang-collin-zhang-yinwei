Boss boss;
SuperCharge superCharge;
ArrayList allAttacks;

void setup() {
  keyboardInput = new KeyboardBuffer();
  size(1500, 700);
	superCharge = new SuperCharge();
  allAttacks = new ArrayList<Attack>();
  Projectile holder = new Projectile(0, 0, 10, 3, 7, 0, true);
  allAttacks.add(holder);
  boss = new Boss();
}

void draw() {
  background(255);
  boss.enact(allAttacks);
	superCharge.update();
	superCharge.showBar();

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
