Projectile projectile;

void setup() {
  size(1500, 500); //just for now
  projectile = new Projectile(50, 50, 5, 1, 5, -5);
}

void draw() {
  projectile.enact();
  background(255);
  showProjectile(projectile);
}

void showProjectile(Projectile p) {
  ellipse(p.x, p.y, p.size, p.size);
}
