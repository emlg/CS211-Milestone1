/* Méthode de vérification d'appuyage de la touche shift */
void keyPressed(){
  if( key == CODED){
    if(keyCode == SHIFT){
      shiftMode = true;
    }
  }
}

/* Méthode de vérification du relâchage de la touche shift */
void keyReleased(){
  if(key == CODED){
    if(keyCode == SHIFT){
      shiftMode = false;
    }
  }
}