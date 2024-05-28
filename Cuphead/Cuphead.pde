Projectile test;
void setup() {
  keyboardInput = new KeyboardBuffer();
  size(1500, 500); //just for now
  test = new Projectile (750, 0, 5, 1.5, 0, 0);
	superCharge = new SuperCharge();
}

void draw() {
  background(255);
  test.enact();
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

	void update() {}
	void showBar() {}
}
