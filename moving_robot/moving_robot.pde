
int random_carpeta;
int fr = 30;
int tg = 10;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

Robot rob;

void setup() {
  size(500, 500);
  frameRate(30);

  rob = new Robot(10);
}

void draw() {
  background(204);                // valor por defecto, esta línea solo lo evidencia

  strokeWeight(2);
  stroke(63, 200, 62);
  fill(255, noise(1, 2)*255, noise(0, 2)*255);

  //updateRobot(frameCount*0.1);

  if (upPressed) {
    rob.yi += rob.linSpeed*sin(rob.th);
    rob.xi += rob.linSpeed*cos(rob.th);
  }
  if (downPressed) {
    rob.yi -= rob.linSpeed*sin(rob.th);
    rob.xi -= rob.linSpeed*cos(rob.th);
  }
  if (leftPressed) {
    rob.th-=radians(rob.angSpeed);
  }
  if (rightPressed) {
    rob.th+=radians(rob.angSpeed);
  }
  rob.update(rob.th);
  //guardar_imagenes();
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      upPressed = true;
    } else if (keyCode == DOWN) {
      downPressed = true;
    } else if (keyCode == LEFT) {
      leftPressed = true;
    } else if (keyCode == RIGHT) {
      rightPressed = true;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      upPressed = false;
    } else if (keyCode == DOWN) {
      downPressed = false;
    } else if (keyCode == LEFT) {
      leftPressed = false;
    } else if (keyCode == RIGHT) {
      rightPressed = false;
    }
  }
}

void updateRobotOri(float th) {
  rob.x1 = rob.xi + (2*rob.size * cos(th));
  rob.y1 = rob.yi - (2*rob.size * sin(th));

  rob.x2 = rob.xi - (rob.size * cos(th));
  rob.y2 = rob.yi - (rob.size * sin(th));

  rob.x3 = rob.xi + (rob.size * cos(th));
  rob.y3 = rob.yi + (rob.size * sin(th));
}


void updateRobot(float th) {
  rob.x1 = rob.xi + (2*rob.size * cos(-th));
  rob.y1 = rob.yi - (2*rob.size * sin(-th));

  rob.x2 = rob.xi - (rob.size * sin(th) + rob.size * cos(th));
  rob.y2 = rob.yi - (rob.size * sin(th) - rob.size * cos(th));

  rob.x3 = rob.xi + (rob.size * sin(th) - rob.size * cos(th));
  rob.y3 = rob.yi - (rob.size * sin(th) + rob.size * cos(th));

/*
  stroke(255, 0, 0); // r
  point(rob.x1, rob.y1);
  stroke(0, 255, 0); // g
  point(rob.x2, rob.y2);
  stroke(0, 0, 255); // b
  point(rob.x3, rob.y3);
  */
  stroke(0);
  triangle(rob.x1, rob.y1, rob.x2, rob.y2, rob.x3, rob.y3);
}


// función que guarda en una carpeta las primeras 1800 imagenes, además muestra frames por segundo
void guardar_imagenes() {
  surface.setTitle("FPS: " + nfs((int)frameRate, 2));
  if (frameCount < (fr*tg)) {

    String folder = str(day()) +"_"+ str(hour()) +"-"+ str(random_carpeta);
    saveFrame("output/"+ folder +"/"+ "####.png" );
  }
  if (frameCount > (30*60)) {
    exit();
  }
}
