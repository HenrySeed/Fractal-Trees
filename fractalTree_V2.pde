
Branch root;

void setup() {
  size(700, 500);
  stroke(255);
  
  
  PVector begin = new PVector(width/2, height);
  PVector end = new PVector(width/2, height-60);
  root = new Branch(begin, end, 1);
}

void draw() {
  clear();
  background(51);
  root.render();
}

void mouseClicked() {
  clear();
  background(51);
  stroke(255);
  PVector begin = new PVector(width/2, height);
  PVector end = new PVector(width/2, height-60);
  root = new Branch(begin, end, 1);
}
