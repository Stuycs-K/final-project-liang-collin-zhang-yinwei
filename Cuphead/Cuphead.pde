import java.util.Random;
Boss boss;
Player player;
ArrayList<Attack> allAttacks;
KeyboardBuffer keyboardInput;
Random random = new Random();
int cloud1y = (int)(random.nextFloat() * 170 + 70);
int cloud2y = (int)(random.nextFloat() * 170 + 70);
int cloud1x = 1700;
int cloud2x = 2000;

void keyPressed() {
  //send the number of the key pressed to your KeyboardBuffer object
  fill(0);
  keyboardInput.press(keyCode,true);
}

void keyReleased() {
  //send the number of the key released to your KeyboardBuffer object
  keyboardInput.press(keyCode,false);
}

void setup() {
  keyboardInput = new KeyboardBuffer();
  size(1536, 700);
  allAttacks = new ArrayList<Attack>();
  boss = new Boss();
  player = new Player();
}

void draw() {
  if (boss.health <= 0) {
    background(0);
    fill(255);
    text("YOU WON", width / 2, height / 2);
  }
  else if (player.health <= 0) {
    background(0);
    fill(255);
    text("YOU LOST", width / 2, height / 2);
  }
  else {
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
    player.enact(allAttacks);
    fill(255);
    textSize(50);
    text("BOSS: " + boss.health + "HP", 1250, 650);
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
