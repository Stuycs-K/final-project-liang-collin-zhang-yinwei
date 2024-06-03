Boss boss;
SuperCharge superCharge;
ArrayList allAttacks;
PImage bg;
PImage goImg;
PImage turnImg;
PImage aimImg;
Player p1;

void setup() {
  bg = loadImage("bg.png");
  p1 = new Player();
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

  p1.enact(null);

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
