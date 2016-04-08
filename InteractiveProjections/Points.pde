//Représentation en 2D d'un point
class My2DPoint {
  float x;
  float y;
  My2DPoint(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

//Représentation en 3D d'un point
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

//Ajout de la quatrième composante
float[] homogeneous3DPoint (My3DPoint p) {
  float[] result = {p.x, p.y, p.z , 1};
  return result;
}

//Convertion d'un point homogène en point 3D
My3DPoint euclidian3DPoint (float[] a) {
    My3DPoint result = new My3DPoint(a[0]/a[3], a[1]/a[3], a[2]/a[3]);
    return result;
}

//Projection d'un point en 3D vers 2D selon le point de vue "eye"
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