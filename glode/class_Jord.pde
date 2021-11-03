class Jord {

  void setup() {

    photo = loadImage("Jorden.jpg");
    noStroke();
    Jord = createShape(SPHERE, r);
    Jord.setTexture(photo);
  }

  void tegnJord() {

    background(51);
    pushMatrix();
    translate(width*0.5, height*0.5);
    rotateY(angle);
    angle += 0.02;

    lights();
    fill(200);
    noStroke();
    shape(Jord);
    popMatrix();
  }
}
