//Rotation sur l'axe X (Axe dans l'écran horizontal orienté vers la droite)
float[][] rotateXMatrix(float angle) {
  return(new float[][] {{1, 0 , 0 , 0},
                        {0, cos(angle), sin(angle) , 0},
                        {0, -sin(angle) , cos(angle) , 0},
                        {0, 0 , 0 , 1}});
}

//Rotation sur l'axe Y (Axe dans l'ecran vertical orienté vers le sol)
float[][] rotateYMatrix(float angle) {
  return(new float[][] {{cos(angle), 0 , sin(angle) , 0},
                        {0, 1, 0 , 0},
                        {-sin(angle), 0 , cos(angle) , 0},
                        {0, 0 , 0 , 1}});
}

//Rotation sur l'axe Z (Axe sortant de l'écran orienté vers nous)
float[][] rotateZMatrix(float angle) {
  return(new float[][] {{cos(angle), -sin(angle) , 0 , 0},
                        {sin(angle), cos(angle), 0 , 0},
                        {0, 0 , 1 , 0},
                        {0, 0 , 0 , 1}});
}
//Changement de taille d'une matrice
float[][] scaleMatrix(float x, float y, float z) {
  return(new float[][] {{x, 0 , 0 , 0},
                        {0, y, 0 , 0},
                        {0, 0 , z , 0},
                        {0, 0 , 0 , 1}});
}

//Déplacement d'une matrice
float[][] translationMatrix(float x, float y, float z) {
  return(new float[][] {{1, 0 , 0 , x},
                        {0, 1, 0 , y},
                        {0, 0 , 1 , z},
                        {0, 0 , 0 , 1}});
}