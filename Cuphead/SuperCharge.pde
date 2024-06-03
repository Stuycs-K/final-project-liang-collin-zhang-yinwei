class SuperCharge {
  int points;
  int pps; //Points per second used for future charm options
  PImage card;

  SuperCharge() {
    points = 0;
    pps = 1;
    card = cardImg;
  }

  void update() {
    if (Math.random() < 0.5) points += pps;
    if (points >= 50) points = 50;
    if (points <= 0) points = 0;
  }

  void showBar() {
    println(points);
    for (int i = 0; i < 10; i++) {
      tint(255, 155);
      image(card, i * ((width - 1350) / 5) + 30, height - 50, ((width - 1350) / 5) + 5, 50);
    }

    for (int i = 0; i < 10; i++) {
      int cp = min(points - (i * 5), 5);
      if (cp > 0) {
        tint(255, 255);
        int fillH = (int) map(cp, 0, 5, 0, 50); //remap point proportional to height
        image(card, i * ((width - 1350) / 5) + 30, height - fillH, ((width - 1350) / 5) + 5 , fillH);
      }
      noFill();
    }
  }
}
