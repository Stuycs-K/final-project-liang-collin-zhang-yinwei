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

class superCharge {
	int points;
	int pps; //Points per second used for future charm options

	SuperCharge() {
		points = 0;
		pps = 5;
	}

	void update() {
		points += pps / frameRate;
		if (points >= 250) points = 250;
	}

	void showBar() {
		for (int i = 0; i < 5; i++) {
      int cp = min(points - (i * 50), 50); //50 ppb
      if (cp > 0) {
        int fillH = (int) map(cp, 0, 50, 0, 50); //remap point proportional to height
        fill(0, 0, 100);
        rect(i * (width / 5), height - 50, width / 5, -fillH);
      }
      noFill();
      rect(i * (width / 5), height - 50, width / 5, -50);
    }
  }
	}
}
