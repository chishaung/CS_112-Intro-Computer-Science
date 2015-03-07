int life = 3;
class ball{
  float x;
  float y;
  float xv;
  float yv;
  int radius;
  
  ball(){  // constructor, a function
    x = width*0.25;
    y = 0;
    radius = 30;
    xv = random(-1,1);
    yv = -1;
  }
  
  void new_ball() {
    x = width*0.25;
    y = 0;
    radius = 30;
    xv = random(-1,1);
    yv = -1;
  }
  
  void change() {
    radius = int (random(15,60));
  }
  
  void change2() {
    yv = random(-5,5);
  }
  
  void bounce(){
    xv = xv * -1;
    yv = yv * -1;
  }
  
  void move(){
    x = x + xv;
    y = y + yv;
      // bounce off sides
    if(abs(x-mouseX) < paddleWidth*0.5 && abs(y-(height-20)) < radius*0.5){
      yv = yv * -1;
      y = y + yv;  // y += yv;
      xv = (x - mouseX) * 0.1;
      score++;  // score = score + 1;  score += 1;
    }
    if(x > width || x < 0){
       xv = xv * -1;
       x = x + xv;
    }
    yv = yv + gravity;
    
    if (y > height) {
      life--;
      if (life > 0) {
      b = new ball();
      }
      else {
      exit();
      }
  }

  }
  
  void draw(){  // draws the ball, a function
    fill(0,255,0);
    ellipse(x,y,radius,radius);
  }
}
void End() {
textSize(120);
text("Game Over", 300, 300); 
fill(0, 102, 153);

}
