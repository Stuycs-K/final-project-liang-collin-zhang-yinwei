PImage bg;
PImage body;
PImage head;

//tentative
void setup() {
  size(1500, 700);
  bg = loadImage("bg.png");
  body = loadImage("body.png");
  head = loadImage("head.png");
}

void draw() {
  image(bg, 0, 0);
  image(body, 1200, 325, body.width / 3.5, body.height / 3.5);
  image(head, 1200, 125, head.width / 5, head.height / 5);
}
