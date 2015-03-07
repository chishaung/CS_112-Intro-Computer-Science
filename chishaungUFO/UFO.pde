class UFO {
  float x;
  float y;
  float xvelocity;
  float yvelocity;
  int radius;
  String direction;
  float gravity = 0.05;
  int Dcolor = 255;
  UFO() {
    direction = "null";
    x = width / 2;
    y = height / 2;
    radius = 30;
    xvelocity = 0;
    yvelocity = -1;
  }
  
  void display() {
    fill(0, Dcolor, 0);
    ellipse(x,y,radius+35,radius);
  
  }
  
  void update() {
    x = x + xvelocity;
    y = y + yvelocity + gravity;
  
    if (x >= 800) {
      x = 10;
    }
  
    if (x <= 0) {
      x = 800;
    }
  
    if (y >= height-50) {
      print("bot");
      yvelocity = yvelocity * -1;
    }
  
    if (y <= 50) {
      print("top");
      yvelocity = yvelocity * -1;
  }

  

}


  
void keyPressed() {
  final int k = keyCode;

  if (k == 'A') 
    xvelocity = xvelocity-0.05;
    
  
    
  if (k == 'D')
    xvelocity = xvelocity+0.05;  

    
  if (k == 'W')
    yvelocity = yvelocity+0.05; ;
    
  if (k == 'S')
    yvelocity = yvelocity+0.05; ;
    
  if (k == 'C')
    Dcolor = (int)random(0, 255);
    
  

}






}
