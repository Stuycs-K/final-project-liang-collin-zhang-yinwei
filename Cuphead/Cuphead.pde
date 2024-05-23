Projectile test;
void setup() {
  size(1500, 500); //just for now
  test = new Projectile (750, 0, 5, 1.5, 0, 0);
}

void draw() {
  background(255);
  test.enact();
}
