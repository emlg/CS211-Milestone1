// Méthode permettant d'obtenir un point à partir d'un vecteur orthonormé

My3DPoint euclidian3DPoint (float[] a) {
    My3DPoint result = new My3DPoint(a[0]/a[3], a[1]/a[3], a[2]/a[3]);
    return result;
}

// Méthode permettant d'obtenir un vecteur orthonormé à partir d'un point

float[] homogeneous3DPoint (My3DPoint p) {
  float[] result = {p.x, p.y, p.z , 1};
  return result;
}

// Méthode permettant de créer une matrice de rotation autour de l'axe X (axe dans l'écran horizontal orienté vers la droite) donné un angle

float[][] rotateXMatrix(float angle) {
  return(new float[][] {{1, 0 , 0 , 0},
                        {0, cos(angle), sin(angle) , 0},
                        {0, -sin(angle) , cos(angle) , 0},
                        {0, 0 , 0 , 1}});
}

// Méthode permettant de créer une matrice de rotation autour de l'axe Y (axe dans l'écran vertical orienté vers le sol) donné un angle

float[][] rotateYMatrix(float angle) {
  return(new float[][] {{cos(angle), 0 , sin(angle) , 0},
                        {0, 1, 0 , 0},
                        {-sin(angle), 0 , cos(angle) , 0},
                        {0, 0 , 0 , 1}});
}

// Méthode permettant de créer une matrice de rotation autour de l'axe Z (axe sortant de l'écran orienté vers nous) donné un angle

float[][] rotateZMatrix(float angle) {
  return(new float[][] {{cos(angle), -sin(angle) , 0 , 0},
                        {sin(angle), cos(angle), 0 , 0},
                        {0, 0 , 1 , 0},
                        {0, 0 , 0 , 1}});
}

// Méthode permettant de créer une matrice qui aggrandit ou réduit la figure selon les 3 axes principaux

float[][] scaleMatrix(float x, float y, float z) {
  return(new float[][] {{x, 0 , 0 , 0},
                        {0, y, 0 , 0},
                        {0, 0 , z , 0},
                        {0, 0 , 0 , 1}});
}

// Méthode permettant de créer une matrice de translation données les valeurs du vecteur de translation

float[][] translationMatrix(float x, float y, float z) {
  return(new float[][] {{1, 0 , 0 , x},
                        {0, 1, 0 , y},
                        {0, 0 , 1 , z},
                        {0, 0 , 0 , 1}});
}

// Méthode permettant d'appliquer les matrices de transformation sur un cube donné

My3DBox transformBox(My3DBox box, float[][] transformMatrix) {
  My3DPoint[] points = box.p;
  My3DPoint[] result = new My3DPoint[points.length];
  for(int i =0; i < points.length; i++){
    float[] point = {points[i].x, points[i].y,points[i].z, 1 };
    result[i] = euclidian3DPoint(multiplyVector(transformMatrix, point));
  }
  return new My3DBox(result);
}