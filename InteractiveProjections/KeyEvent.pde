//Reaction à des touches pour augmenter ou diminuer la valeur de l'angle correspondant
void keyPressed(){
   if(key == CODED){
      if(keyCode == UP){
        moveX += PI/12;
      } else if(keyCode == DOWN){
        moveX -= PI/12;
      } else if(keyCode == LEFT){
        moveY += PI/12;
      } else if(keyCode == RIGHT){
        moveY -= PI/12;
      }
   }
}