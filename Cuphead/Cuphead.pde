import java.util.Random;
Boss boss;
ArrayList<Attack> allAttacks;
Random random = new Random();
int cloud1y = (int)(random.nextFloat() * 170 + 70);
int cloud2y = (int)(random.nextFloat() * 170 + 70);
int cloud1x = 1700;
int cloud2x = 2000;

void setup() {
  keyboardInput = new KeyboardBuffer();
  size(1536, 700);
  allAttacks = new ArrayList<Attack>();
  boss = new Boss();
}

void draw() {
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

void cloud1(int x, int y) {
  stroke(255);
  fill(255);
  circle(x, y, 50);
  circle(x + 30, y + 5, 50);
  circle(x - 40, y - 10, 50);
  circle(x + 5, y - 25, 80);
  stroke(0);
}

void cloud2(int x, int y) {
  stroke(255);
  fill(255);
  ellipse(x, y, 200, 60);
  circle(x - 30, y - 30, 70);
  circle(x - 55, y + 15, 100);
  circle(x + 10, y + 20, 60);
  circle(x + 40, y - 20, 90);
  stroke(0);
}
