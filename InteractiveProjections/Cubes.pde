class My2DBox {
  My2DPoint[] s;
  //Les 8 points nécessaires pour le cube
  My2DBox(My2DPoint[] s) {
    this.s = s;
  }
  void render(){
    strokeWeight(5);
    strokeJoin(ROUND);
    stroke(220, 150, 60);
    //Création des lignes pour dessiner le cube
    line(s[0].x, s[0].y, s[1].x, s[1].y);
    line(s[1].x, s[1].y, s[2].x, s[2].y);
    line(s[2].x, s[2].y, s[3].x, s[3].y);
    line(s[0].x, s[0].y, s[3].x, s[3].y);
    line(s[0].x, s[0].y, s[4].x, s[4].y);
    line(s[1].x, s[1].y, s[5].x, s[5].y);
    line(s[2].x, s[2].y, s[6].x, s[6].y);
    line(s[3].x, s[3].y, s[7].x, s[7].y);
    line(s[4].x, s[4].y, s[5].x, s[5].y);
    line(s[5].x, s[5].y, s[6].x, s[6].y);
    line(s[6].x, s[6].y, s[7].x, s[7].y);
    line(s[4].x, s[4].y, s[7].x, s[7].y);
  }
}

class My3DBox {
  My3DPoint[] p;
  My3DBox(My3DPoint origin, float dimX, float dimY, float dimZ){
      float x = origin.x;
      float y = origin.y;
      float z = origin.z;
      //Creation des points avec des coordonnées selon les dimensions données en paramètres
      this.p = new My3DPoint[]{new My3DPoint(x,y+dimY,z+dimZ),
                                new My3DPoint(x,y,z+dimZ),
                                new My3DPoint(x+dimX,y,z+dimZ),
                                new My3DPoint(x+dimX,y+dimY,z+dimZ),
                                new My3DPoint(x,y+dimY,z),
                                origin,
                                new My3DPoint(x+dimX,y,z),
                                new My3DPoint(x+dimX,y+dimY,z)
                                };
}
My3DBox(My3DPoint[] p) {
  this.p = p;
  }
}

//Projection d'une boite en 3D depuis le point de vue eye
My2DBox projectBox (My3DPoint eye, My3DBox box) {
  My3DPoint[] points = box.p;
  My2DPoint[] result = new My2DPoint[points.length];
  for(int i = 0; i< points.length; i++){
    result[i] = projectPoint(eye, points[i]);
  }
  return new My2DBox(result);
}

My3DBox transformBox(My3DBox box, float[][] transformMatrix) {
  //Application de la matrice de transformation sur la boite
  My3DPoint[] points = box.p;
  My3DPoint[] result = new My3DPoint[points.length];
  for(int i =0; i < points.length; i++){
    float[] point = {points[i].x, points[i].y,points[i].z, 1 };
    result[i] = euclidian3DPoint(multiplyVector(transformMatrix, point));
  }
  return new My3DBox(result);
}