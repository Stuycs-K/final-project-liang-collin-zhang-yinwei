class SuperCharge {
  int points;
  int pps; //Points per second used for future charm options
  PImage card;

  SuperCharge() {
    points = 0;
    pps = 1;
    card = loadImage("card.png");
  }

  void update() {
    if (Math.random() < 0.1) points += pps;
    if (points >= 10000) points = 10000;
  }

  void showBar() {
    for (int i = 0; i < 5; i++) {
      tint(255, 155);
      image(card, i * ((width - 1350) / 5) + 5, height - 50, ((width - 1350) / 5) + 5, 50);
    }

    for (int i = 0; i < 5; i++) {
      int cp = min(points - (i * 5), 5);
      if (cp > 0) {
        tint(255, 255);
        int fillH = (int) map(cp, 0, 5, 0, 50); //remap point proportional to height
        image(card, i * ((width - 1350) / 5) + 5, height - fillH, ((width - 1350) / 5) + 5 , fillH);
      }
      noFill();
    }
  }
}
