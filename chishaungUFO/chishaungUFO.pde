/*
1. bounce - ok
2. left side right side - ok
3. gravity - ok
4. keyboard control - ok (W A S D and C to change color)
5. velocity, not its position - ok
*/


UFO ufo;

void setup() {
size(800,600);
frameRate(60);
ufo = new UFO();

}

void draw() {

  fill(200,30);  // greyscale, alpha/tranparency
  rect(0,0,width,height);
  ufo.display();
  ufo.update();
  ufo.keyPressed();
}



