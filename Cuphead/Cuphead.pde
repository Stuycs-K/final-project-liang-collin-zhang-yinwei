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
  background(192, 212, 237);
  background(182, 69, 28);
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
  cloud1(cloud1x, cloud1y);
  cloud2(cloud2x, cloud2y);
  building1(0, 80);
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
  fill(200);
  circle(x, y, 50);
  circle(x + 30, y + 5, 50);
  circle(x - 40, y - 10, 50);
  circle(x + 5, y - 25, 80);
  stroke(0);
}

void cloud2(int x, int y) {
  stroke(190);
  fill(200);
  ellipse(x, y, 200, 60);
  circle(x - 30, y - 30, 70);
  circle(x - 55, y + 15, 100);
  circle(x + 10, y + 20, 60);
  circle(x + 40, y - 20, 90);
  stroke(0);
}

void building1 (int x, int yDep) {
  stroke(57, 39, 58);
  fill(82, 57, 85);
  rect(x, (height - 200) + yDep, 70, height - 200, 7);
  triangle(x + 32, (height - 200) + yDep, x + 38, (height - 200) + yDep, x + 35, (height - 270) + yDep);
  rect(x + 60, (height - 120) + yDep, 80, height - 120, 7);
  stroke(0);
}

void building2 (int x, int yDep) {
  stroke(57, 39, 58);
  fill(82, 57, 85);
  stroke(0);
}

void building3 (int x, int yDep) {
  stroke(57, 39, 58);
  fill(82, 57, 85);
  stroke(0);
}
