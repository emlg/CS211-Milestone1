
float change = 1; //facteur de changement de la vitesse de rotation

/* Méthode qui change l'angle de la plaque selon la position de la souris (lors d'un clic gauche de la souris)  */
void mouseDragged(){
   valueZ += (mouseX- pmouseX) *change;
   valueX += (mouseY- pmouseY) *change;
   if(valueX < 0) {
    valueX =0;
  } else if (valueX > height) {
    valueX = height;
  } else if (valueZ <0){
    valueZ = 0;
  } else if (valueZ > width){
    valueZ = width;
  }
  angleX = map(valueX, 0, height, PI/6, -PI/6);
  angleZ = map(valueZ, 0 , width, -PI/6, PI/6);
}

<<<<<<< HEAD
/* Méthode qui fait varier la variable change selon la roue de la souris  */
=======
float change = 1;
>>>>>>> 55358d5203203d6945db9ead99ef5807a28ab019
void mouseWheel(MouseEvent event) {
  change += event.getCount();
  if(change > 1.5) {
     change = 1.5;
  } else if (change < 0.2){
    change = 0.2;
  }
  println(change);
}

/* Méthode d'ajout d'un cylindre sur la plaque lors d'un clic de souris, si la plaque est shiftée */
void mouseClicked(){
  if(shiftMode){
    PVector position = new PVector(mouseX, mouseY);
    PVector p2 = new PVector(mouseX - width/2, mouseY - height/2);
    PVector upLeft = new PVector(width/2f - boxX/2f, height/2f - boxZ/2f);
    PVector bottomRight =  new PVector(width/2f + boxX/2f, height/2f + boxZ/2f);
    if( position.x >= upLeft.x + Cylinder.cylinderBaseSize
     && position.x <= bottomRight.x - Cylinder.cylinderBaseSize
     && position.y >= upLeft.y + Cylinder.cylinderBaseSize
     && position.y <= bottomRight.y - Cylinder.cylinderBaseSize
     && ball.location.dist(p2) > ball.r + Cylinder.cylinderBaseSize){ 
        cylinders.add(position);
     }
  }
}