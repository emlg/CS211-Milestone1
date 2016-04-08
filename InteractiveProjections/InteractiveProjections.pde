void settings() {
  size(500, 500, P2D);
}

void setup() {
}

float moveX = 0;
float moveY = 0;
int boxSize = 50;

void draw() {
  background(150, 75, 100);
  My3DPoint eye = new My3DPoint(0, 0, -5000);
  My3DPoint origin = new My3DPoint(0, 0, 0);
  My3DBox input3DBox = new My3DBox(origin, boxSize, boxSize, boxSize);
  
  //Placer au milieu
  translate(width/2f - boxSize/2f, height/2f - boxSize/2f);
  //Creer la matrice de double rotation
  float[][] transform = multiplyMatrix(rotateXMatrix(moveX), rotateYMatrix(moveY));
  input3DBox = transformBox(input3DBox, transform);
  //Dessiner la boite avec les rotations prises en compte
  projectBox(eye, input3DBox).render();
}