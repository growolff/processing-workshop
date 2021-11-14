

class Robot {
  float xi;
  float yi;

  float linSpeed;
  float angSpeed;

  int size;

  float th; // orientación en el plano
  float x1, y1, x2, y2, x3, y3;

  Robot(int size) {
    this.xi = width/2;
    this.yi = height/2;

    this.linSpeed = 5;
    this.angSpeed = 5;

    this.th = 0;

    this.size = size;
  }

  void update(float th) {
    rob.x1 = rob.xi + (2*rob.size * cos(-th));
    rob.y1 = rob.yi - (2*rob.size * sin(-th));

    rob.x2 = rob.xi - (rob.size * sin(th) + rob.size * cos(th));
    rob.y2 = rob.yi - (rob.size * sin(th) - rob.size * cos(th));

    rob.x3 = rob.xi + (rob.size * sin(th) - rob.size * cos(th));
    rob.y3 = rob.yi - (rob.size * sin(th) + rob.size * cos(th));

    stroke(255, 0, 0); // r
    point(rob.x1, rob.y1);
    stroke(0, 255, 0); // g
    point(rob.x2, rob.y2);
    stroke(0, 0, 255); // b
    point(rob.x3, rob.y3);
    stroke(0);
    triangle(rob.x1, rob.y1, rob.x2, rob.y2, rob.x3, rob.y3);
  }
}
