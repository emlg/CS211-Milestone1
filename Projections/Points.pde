// Classe permettant de définir un point en 2D

class My2DPoint {
  float x;
  float y;
  My2DPoint(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

// Classe permettant de définir un point en 2D

class My3DPoint {
  float x;
  float y;
  float z;
  My3DPoint(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
}

// Classe permettant d'obtenir une projection en 2D à partir d'un point en 3D

My2DPoint projectPoint(My3DPoint eye, My3DPoint p) {
    float[][] matrixT = {{1, 0, 0, -eye.x},
                    {0,1,0, - eye.y},
                    {0,0,1,-eye.z},
                    {0,0,0,1}};
    float[][] matrixP = {{1,0,0,0},
                   {0,1,0,0},
                   {0,0,1,0},
                   {0,0, 1/(-eye.z),0}};
    float[][] transformation = multiplyMatrix(matrixP, matrixT);
    float[] point = {p.x, p.y, p.z , 1};
    float[] result = multiplyVector(transformation, point);
    return new My2DPoint(result[0]/result[3], result[1]/result[3]);
}