Boss boss;
ArrayList<Attack> allAttacks;
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
  allAttacks = new ArrayList<Attack>();
  boss = new Boss();

  goImg = loadImage("go.png");
  turnImg = loadImage("turn.png");
  aimImg = loadImage("aim.png");
}

void draw() {
  background(bg);
  boss.enact(allAttacks);
  p1.enact(allAttacks);

  if (keyboardInput.P1_LEFT) {
    image(goImg, 30, 40, 50, 50);
  }
  if (keyboardInput.P1_RIGHT) {
    image(turnImg, 90, 40, 50, 50);
  }
  if (keyboardInput.P1_SPACE) {
    image(aimImg, 150, 40, 50, 50);
  }
}
