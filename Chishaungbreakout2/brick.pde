
class brick{
  float x;
  float y;
  float w;
  float h;
  color c;  // a color variable holds a color
  boolean present;  // a boolean variable has the value true or false
  
  brick(int startX, int startY, color startC){
    x = startX;
    y = startY;
    w = 50;
    h = 10;
    present = true;
    c = startC;
  }
  
  void display(){
    if(present == true){
      fill(c);
      rect(x,y,w,h);
    }
  }
  
  void check_hit(ball b){
    if(present == false){ // if brick is absent don't bounce
        return;
    }
    

    float r = b.radius*0.5;;
    if(b.x > x-r && b.x < x + w + r){
      if(b.y > y-r && b.y< y + r + h){
        b.bounce();  // tell the ball to bounce
        b.change();

        present = false; // brick is }
        Bricks_Size--;
  }}
}
  
    void check_hit2(ball b){
    if(present == false){ // if brick is absent don't bounce
        return;
    }
    

    float r = b.radius*0.5;;
    if(b.x > x-r && b.x < x + w + r){
      if(b.y > y-r && b.y< y + r + h){
        b.bounce();  // tell the ball to bounce
        b.change2();

        present = false; // brick is gone
        Bricks_Size--;
      }
    }
  }
  
  
  
  
}
  
