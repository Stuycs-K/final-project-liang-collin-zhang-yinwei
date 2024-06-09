Boss boss;
ArrayList<Attack> allAttacks;
KeyboardBuffer keyboardInput;
PImage beamImg;
PImage beamPImg;
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
int building1x = 2050;
int building1y = (int)(random.nextFloat() * 80);
int building2x = 1050;
int building2y = (int)(random.nextFloat() * 100);
boolean titleScreen;
String titleScreenText;

void setup() {
  beamPImg = loadImage("beamP.png");
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
  titleScreen = true;
  titleScreenText = "";
}

void draw() {
  if (titleScreen) {
    background(252);
    fill(0);
    textSize(30);
    text("WELCOME TO", width / 2 - 100, height / 2 - 170);
    text(titleScreenText, width / 2 - 145, height / 2 - 240);
    fill(252, 0, 0);
    textSize(150);
    text("CUPHEAD: APCS MANIA", width / 2 - 730, height / 2 - 11);
    fill(0);
    textSize(30);
    text("Developed by Collin Liang and Yinwei Zhang", width / 2 - 270, height / 2 + 50);
    text("Press SPACE to begin or S to quit", width / 2 - 210, height - 50);
    if (keyboardInput.P_SPACE) {
      setup();
      titleScreen = false;
    }
    else if(keyboardInput.P_DOWN) {
      exit();
    }
  }
  else {
    background(192, 212, 237);
    background(182, 69, 28);
    cloud1x -= 6;
    cloud2x -= 6;
    building1x -= 6;
    building2x -= 6;
    if (cloud1x <= -400) {
      cloud1x = 1700;
      cloud1y = (int)(random.nextFloat() * 170 + 70);
    }
    if (cloud2x <= -500) {
      cloud2x = 2000;
      cloud2y = (int)(random.nextFloat() * 170 + 70);
    }
    if (building1x <= -300) {
      building1y = (int)(random.nextFloat() * 80);
      building1x = 1750;
    }
    if (building2x <= -340) {
      building2y = (int)(random.nextFloat() * 100);
      building2x = 1650;
    }
    cloud1(cloud1x, cloud1y);
    cloud2(cloud2x, cloud2y);
    building1(building1x, building1y);
    building2(building2x, building2y);
    boss.enact(allAttacks);
    p1.enact(allAttacks);
    text("THE BOSS HAS " + boss.health + " HEALTH LEFT!",50,50);
    
    for (int i = allAttacks.size() - 1; i >= 0; i--) {
      Attack atk = allAttacks.get(i);
      if (atk.position.x > width || atk.position.x < 0 || atk.position.y > height || atk.position.y < 0) {
        atk.deactivate();
        allAttacks.remove(i);
      }
    }
    
    if(boss.health <= 0) {
      titleScreen = true;
      titleScreenText = "YOU BEAT THE BOSS";
    }
    
    if(p1.health <= 0) {
      titleScreen = true;
      titleScreenText = "THE BOSS BEAT YOU";
    }
    
    if(p1.position.x < -500 || p1.position.y < -300 || p1.position.y > 1000 || p1.position.x > 1300) {
      titleScreen = true;
      titleScreenText = "YOU WERE BLOWN AWAY";
    }
  }
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
  rect(x, (height - 200) + yDep, 110, height - 200, 7);
  triangle(x + 52, (height - 200) + yDep, x + 58, (height - 200) + yDep, x + 55, (height - 270) + yDep);
  rect(x + 60, (height - 120) + yDep, 120, height - 120, 7);
  stroke(0);
}

void building2 (int x, int yDep) {
  stroke(57, 39, 58);
  fill(82, 57, 85);
  rect(x - 120, (height - 270), 170, height - 270, 7);
  rect(x + 10, (height - 240) + yDep, 85, height  - 240, 7);
  rect(x + 100, (height - 400) + yDep, 55, height, 3);
  quad(x - 220, height + 10, x - 140, height + 10, x - 160, height - 400, x - 200, height - 400);
  stroke(0);
}

void building3 (int x, int yDep) {
  stroke(57, 39, 58);
  fill(82, 57, 85);
  stroke(0);
}
