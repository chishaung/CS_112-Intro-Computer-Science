/*
Chihsiang Wang
Assignment 9
1. 3 livies, game over will dodge out the program.
2. 2 kinds of bricks, one for changing the balls' size, one for changing the speed.
3. 2 "Single Rows" of bricks to knockout
*/

ball b; // create a ball
float gravity; // acceleration due to gravity
int paddleWidth;
int score;
int num_of_bricks= 15;
brick brick1;
brick brick2;
int count = 0;
int count2 = 0;
brick[] bricks1;
brick[] bricks2;
//int life = 3;

void setup(){
  size(800,600);
  frameRate(60);
  score = 0;
  paddleWidth = 100;  // nice wide paddle
  gravity = 0.1;  // adjust gravity here
  //brick1 = new brick(int(height*0.5),100, color(0,0,255)); // create a brick
  //brick2 = new brick(int(height*0.5)+60,100, color(0,0,100));
  b = new ball();  // create a ball
  
  bricks1 = new brick[num_of_bricks];
  for (int i = 0; i< num_of_bricks; i++) {
    bricks1[i] = new brick(count * 60,100, color(0,0,100));
    count++;
  }
  
    bricks2 = new brick[num_of_bricks];
    for (int i = 0; i< num_of_bricks; i++) {
    bricks2[i] = new brick(count2 * 60,150, color(100,100,100));
    count2++;
  }
  
  textSize(30);
  fill(0);
}

void draw(){
  fill(200,30);  // greyscale, alpha/tranparency
  rect(0,0,width,height);

  b.move();  // move each ball
  b.draw(); // draw each ball
  //brick1.display();
  //brick1.check_hit(b);
  //brick2.display();
  //brick2.check_hit(b);

  for (int i = 0; i < num_of_bricks; i++) {
    bricks1[i].display();
    bricks1[i].check_hit(b);
  }
    for (int i = 0; i < num_of_bricks; i++) {
    bricks2[i].display();
    bricks2[i].check_hit2(b);
  }
  fill(255,0,0);
  rect(mouseX-paddleWidth*0.5,height-20,paddleWidth,10);
  fill(0);
  text("Test",width*0.5,50);

  
  }








