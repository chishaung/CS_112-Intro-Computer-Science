/*
Chihsiang Wang
Assignment #8
Apr.14th.2014


*Put a block comment at the beginning of the program with your name, the assignment number, and the date.
*Have the player's score increase by 1 for bouncing the ball off the paddle and by 2 for bouncing the ball off a wall.
*After every 10 bounces off the paddle have the ball's speed increase by 10 percent or the paddle shrink by 10 percent.
*Use the text command to print the player's score at the top middle of the screen.
If the ball goes off the bottom of the screen have the program print Game Over in large letters in the center of the screen.
Extra Credit: Give the player three lives. The number of lives should be represented by small circles (balls) in the upper right hand corner of the screen.

*/


float x;  // ball's x position  
float y;  // ball's y position
float gravity; // acceleration due to gravity
int ballRadius;
int paddleWidth;
float xv, yv;  // x and y velocities
int scores = 0;
int counter = 0;
PFont f;
int life = 3;

void setup(){
  size(800,600);
  x = width*0.5;
  y = height*0.5;
  ballRadius = 50;  // nice large ball
  paddleWidth = 100;  // nice wide paddle
  xv = 0.2;
  yv = -6; // start with the ball moving up
  gravity = 0.1;  // adjust gravity here
  f = createFont("Arial",16,true); 
}


void draw(){

  background(200);
  ellipse(x,y,ballRadius,ballRadius);
  rect(mouseX-paddleWidth*0.5,height-20,paddleWidth,10);
  textSize(32);
  text(scores, width/2, 30); 


  switch(life) {
    case 3:
    ellipse(width-50,30,10,10);
    ellipse(width-70,30,10,10);
    ellipse(width-90,30,10,10);
    break;
    
    case 2:
    ellipse(width-50,30,10,10);
    ellipse(width-70,30,10,10);
    break;
    
    case 1:
    ellipse(width-50,30,10,10);
    break;
  
  }


  x = x + xv;
  y = y + yv;
  /*
  if(y > height-ballRadius*0.5 || y < 0){
    yv = yv * -1;
    y = y + yv;
  }
  */
  // corrected paddle bounce
  if(abs(x-mouseX) < paddleWidth*0.5 && abs(y-(height-20)) < ballRadius*0.5){
    yv = yv * -1;
    y = y + yv;
    scores++; // touch the paddle
    counter++;
    
  }
  // bounce off sides
  if(x > width || x < 0){
    xv = xv * -1;
    x = x + xv;
    scores += 2; // touch the wall
  }
  
  // Miss
  if (y > height) {
    life--;
    if (life > 0) {
    setup();
    draw();
    }
    else {
    End();
    }
  }
  

  if (counter > 0 && counter % 10 == 0) {
    gravity = gravity + (gravity*0.1);
  }
  yv = yv + gravity;


} 



void End() {
textSize(120);
text("Game Over", 80, height/2); 
fill(0, 102, 153);

}
