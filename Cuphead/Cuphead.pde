Projectile projectile;

void setup() {
  size(1500, 500); //just for now
  projectile = new Projectile(50, 50, 5, 5, 5, -5);
}

void draw() {
  projectile.enact();
  showProjectile(projectile);
}

void showProjectile(Projectile p) {
  ellipse(p.x, p.y, p.size, p.size);
}
