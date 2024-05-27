Projectile test;
PImage goImg;
PImage turnImg;
PImage aimImg;

void setup() {
  keyboardInput = new KeyboardBuffer();
  size(1500, 500); //just for now
  test = new Projectile (750, 0, 5, 1.5, 0, 0);
  goImg = loadImage("go.png");
  turnImg = loadImage("turn.png");
  aimImg = loadImage("aim.png");
}

void draw() {
  background(255);
  test.enact();
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
