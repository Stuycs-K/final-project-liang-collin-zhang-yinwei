Boss boss;
SuperCharge superCharge;
ArrayList allAttacks;
PImage bg;

void setup() {
  bg = loadImage("bg.png");
  keyboardInput = new KeyboardBuffer();
  size(1536, 700);
  superCharge = new SuperCharge();
  allAttacks = new ArrayList<Attack>();
  Projectile holder = new Projectile(0, 0, 10, 3, 7, 0, true);
  allAttacks.add(holder);
  boss = new Boss();

  goImg = loadImage("go.png");
  turnImg = loadImage("turn.png");
  aimImg = loadImage("aim.png");
}

void draw() {
  background(bg);
  boss.enact(allAttacks);
  superCharge.update();
  superCharge.showBar();

  if (keyboardInput.P1_LEFT) {
    image(goImg, 10, 10, 50, 50);
  }
  if (keyboardInput.P1_RIGHT) {
    image(turnImg, 70, 10, 50, 50);
  }
  if (keyboardInput.P1_SPACE) {
    image(aimImg, 40, 60, 50, 50);
  }
}
