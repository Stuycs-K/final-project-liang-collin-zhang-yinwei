Projectile test;
SuperCharge superCharge;

void setup() {
  keyboardInput = new KeyboardBuffer();
  size(1500, 500); //just for now
  test = new Projectile (750, 0, 5, 1.5, 0, 0);
	superCharge = new SuperCharge();
}

void draw() {
  background(255);
  test.enact();
	superCharge.update();
	superCharge.showBar();

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

class SuperCharge {
	int points;
	int pps; //Points per second used for future charm options

	SuperCharge() {
		points = 0;
		pps = 1;
	}

	void update() {
    if (Math.random() < 0.1) points += pps;
	  if (points >= 10000) points = 10000;
	}

	void showBar() {
		for (int i = 0; i < 5; i++) {
      int cp = min(points - (i * 5), 5);
      if (cp > 0) {
        int fillH = (int) map(cp, 0, 5, 0, 50); //remap point proportional to height
        fill(100, 100, 100);
        rect(i * ((width - 1350) / 5) + 5, height - 5, ((width - 1350) / 5) + 5 , -fillH);
      }
      noFill();
    }
  }
}
