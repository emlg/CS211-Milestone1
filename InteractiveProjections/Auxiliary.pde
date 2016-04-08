float[][] multiplyMatrix(float[][] A, float[][] B) {
  float[][] result = new float[A.length][B[0].length];
  for(int i =0; i<A.length; i++){
    for(int j =0; j< B[0].length; j++){
        for(int k = 0; k <A.length; k++){
           result[i][j] += A[i][k]*B[k][j];
        }
    }
  }
  return result;
}

float[] multiplyVector(float[][] A, float[] vect) {
  float[] result = new float[A.length];
  for(int i =0; i< A.length; i++){
    for(int k = 0; k< vect.length; k++){
      result[i] += A[i][k]* vect[k];
    }
  }
  return result;
}