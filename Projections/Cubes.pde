// Classe permettant de définir un cube en 2D

class My2DBox {
  My2DPoint[] s;
  
  My2DBox(My2DPoint[] s) {
    this.s = s;
  }
  
  // Méthode permettant de dessiner la boite
  
  void render(){
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

// Classe permettant de définir un cube en 3D

class My3DBox {
  My3DPoint[] p;
  
  My3DBox(My3DPoint[] p){
    this.p = p;
  }
  
  My3DBox(My3DPoint origin, float dimX, float dimY, float dimZ){
      float x = origin.x;
      float y = origin.y;
      float z = origin.z;
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
}

// Méthode permettant d'obtenir une projection 2D à partir d'un cube en 3D

My2DBox projectBox (My3DPoint eye, My3DBox box) {
  My3DPoint[] points = box.p;
  My2DPoint[] result = new My2DPoint[points.length];
  for(int i = 0; i< points.length; i++){
    result[i] = projectPoint(eye, points[i]);
  }
  return new My2DBox(result);
}