/*
Chihsiang Wang
Assignment 10
1. Import a Image, yes, my Dog is watching you.

2. 2 Game status - Running and Paused:
   During the Game press 's' to pause the game
                   press 'r' to resume.
                   
3. When bricks are all gone - Game Over. You can chage line 62 to
   be Bricks_Size <= 29 for testing.
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
PImage img;
int Bricks_Size = 0;


void setup(){
  img = loadImage("123.jpg");
  size(800,600);
  frameRate(60);
  score = 0;
  paddleWidth = 100;  // nice wide paddle
  gravity = 0.1;  // adjust gravity here
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
  Bricks_Size = bricks1.length + bricks2.length;
  textSize(30);
  fill(0);
}

void draw(){
  
  image(img, 0, 0);
  fill(200,30);  // greyscale, alpha/tranparency
  rect(0,0,width,height);

  b.move();  // move each ball
  b.draw(); // draw each ball

  if (Bricks_Size <= 0) {
  Win();
  }
  
  
  
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
  text(Bricks_Size,width*0.5,50);
  keyPressed();
  
  }
  
  
  void keyPressed() {
  final int k = keyCode;

  if (k == 'S')
    if (looping)  noLoop();
    
  if (k == 'R')
    if (!looping) loop();
}

void Win() {
textSize(50);
text("You win.", 200, 300); 
fill(0, 102, 153);
noLoop();
}






