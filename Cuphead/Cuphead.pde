Boss boss;
ArrayList<Attack> allAttacks;
KeyboardBuffer keyboardInput;
PImage beamImg;
PImage fireballImg;
PImage bodyImg;
PImage headImg;
PImage planeNormalImg;
PImage cardImg;
PImage hpImg;
Player p1;
Random random = new Random();
int cloud1y = (int)(random.nextFloat() * 170 + 70);
int cloud2y = (int)(random.nextFloat() * 170 + 70);
int cloud1x = 1700;
int cloud2x = 2000;

void setup() {
  beamImg = loadImage("beam.png");
  fireballImg = loadImage("fireball.png");
  bodyImg = loadImage("body.png");
  headImg = loadImage("head.png");
  planeNormalImg = loadImage("plane.png");
  cardImg = loadImage("card.png");
  hpImg = loadImage("hp.png");
  
  p1 = new Player();
  keyboardInput = new KeyboardBuffer();
  size(1536, 700);
  allAttacks = new ArrayList<Attack>();
  boss = new Boss();
}

void draw() {
  background(186, 208, 219);
  cloud1x -= 6;
  cloud2x -= 6;
  if (cloud1x <= -400) {
    cloud1x = 1700;
    cloud1y = (int)(random.nextFloat() * 170 + 70);
  }
  if (cloud2x <= -500) {
    cloud2x = 2000;
    cloud2y = (int)(random.nextFloat() * 170 + 70);
  }
  background(152, 245, 249);
  cloud1(cloud1x, cloud1y);
  cloud2(cloud2x, cloud2y);
  boss.enact(allAttacks);
  p1.enact(allAttacks);

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

void cloud1(int x, int y) {
  stroke(190);
  fill(190);
  circle(x, y, 50);
  circle(x + 30, y + 5, 50);
  circle(x - 40, y - 10, 50);
  circle(x + 5, y - 25, 80);
  stroke(0);
}

void cloud2(int x, int y) {
  stroke(190);
  fill(190);
  ellipse(x, y, 200, 60);
  circle(x - 30, y - 30, 70);
  circle(x - 55, y + 15, 100);
  circle(x + 10, y + 20, 60);
  circle(x + 40, y - 20, 90);
  stroke(0);
}
