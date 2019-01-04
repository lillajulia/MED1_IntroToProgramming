int size = 50;
Circle[] circles = new Circle[size];

void setup() {
  size(500, 500);
  background(0, 0, 0);

  for (int i = 0; i < size; i++) { // this stores the positions of the previous ellipses in the array
    circles[i] = new Circle();
  }
}

void draw () {
  background(0, 0, 0);
  for (int i = size - 1; i > 0; i--) {
    circles[i] = circles[i - 1]; // takes all the elements from the array and moves them one position forward. It loses the oldest one. And it creates a new one on the first position.
    circles[i].draw(); // this method draws a circle on the given positions of the array
  }
  circles[0] = new Circle(); //createnw one on first position of the array
}
