Boss boss;
ArrayList<Attack> allAttacks;
KeyboardBuffer keyboardInput;
PImage bg;
/*PImage turnImg;
PImage aimImg;
PImage goImg;*/
PImage beamImg;
PImage fireballImg;
PImage bodyImg;
PImage headImg;
PImage planeNormalImg;
PImage cardImg;
PImage hpImg;
Player p1;

void setup() {
  bg = loadImage("bg.png");
  /*goImg = loadImage("go.png");
  turnImg = loadImage("turn.png");
  aimImg = loadImage("aim.png");*/
  beamImg = loadImage("beam.png");
  fireballImg = loadImage("fireball.png");
  bodyImg = loadImage("body.png");
  headImg = loadImage("head.png");
  planeNormalImg = loadImage("plane.png");
  cardImg = loadImage("card.png");
  hpImg = loadImage("hp.png");
  
  bg = loadImage("bg.png");
  p1 = new Player();
  keyboardInput = new KeyboardBuffer();
  size(1536, 700);
  allAttacks = new ArrayList<Attack>();
  boss = new Boss();
}

void draw() {
  background(bg);
  boss.enact(allAttacks);
  p1.enact(allAttacks);

  /*if (keyboardInput.P1_RIGHT) {
    image(goImg, 30, 40, 50, 50);
  }
  if (keyboardInput.P1_LEFT) {
    image(turnImg, 90, 40, 50, 50);
  }
  if (keyboardInput.P1_SPACE) {
    image(aimImg, 150, 40, 50, 50);
  }*/ //replace with updated arrow keypads
}

void keyPressed() {
  //send the number of the key pressed to your KeyboardBuffer object
  fill(0);
  keyboardInput.press(keyCode,true);
}

void keyReleased() {
  //send the number of the key released to your KeyboardBuffer object
  keyboardInput.press(keyCode,false);
}
