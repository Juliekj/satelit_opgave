PVector yAxis = new PVector(0, 1, 0);
PVector zAxis = new PVector(0, 0, 1);

float rotation = 0;
float angle;

PImage photo;
PShape Jord;
float r = 100;

float rSatelit;
float posAfstand;
float posAngle;
float rotationsTrin;

PVector pos1V;
PVector pos2V;
PVector rotationVec = new PVector();

Jord J = new Jord();
Satelite S = new Satelite();



void setup() {
  size(800, 800, P3D);
  S.setup();
  J.setup();
}

void draw() {
  clear();


  J.tegnJord();
  S.tegnsSelite();
}
