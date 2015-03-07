import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Chishaungbounce extends PApplet {

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

public void setup(){
  size(800,600);
  x = width*0.5f;
  y = height*0.5f;
  ballRadius = 50;  // nice large ball
  paddleWidth = 100;  // nice wide paddle
  xv = 0.2f;
  yv = -6; // start with the ball moving up
  gravity = 0.1f;  // adjust gravity here
  f = createFont("Arial",16,true); 
}


public void draw(){
  background(200);
  ellipse(x,y,ballRadius,ballRadius);
  rect(mouseX-paddleWidth*0.5f,height-20,paddleWidth,10);
  textSize(32);
  text(scores, width/2, 30); 


  x = x + xv;
  y = y + yv;
  /*
  if(y > height-ballRadius*0.5 || y < 0){
    yv = yv * -1;
    y = y + yv;
  }
  */
  // corrected paddle bounce
  if(abs(x-mouseX) < paddleWidth*0.5f && abs(y-(height-20)) < ballRadius*0.5f){
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
    End();
  }
  
  
  if (counter > 0 && counter % 10 == 0) {
    gravity = gravity + (gravity*0.1f);
  }
  yv = yv + gravity;

}

public void End() {
textSize(120);
text("Game Over", 80, height/2); 
fill(0, 102, 153);
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Chishaungbounce" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
