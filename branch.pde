class Branch{
  
  Branch[] kids;
  PVector begin;
  PVector end;
  int level;
  int numKids;
  boolean drawn;
  float leafY;
  
  Branch(PVector begin, PVector end, int level) {
    this.begin = begin;
    this.end = end;
    this.level = level;
    this.drawn = false;
    this.leafY = this.end.y;
    
    if(level < 9){
      // generate a random number of kids
      this.numKids = int(random(2, 2));
      this.kids = new Branch[this.numKids];
      for(int i = 0; i < this.numKids; i++){
         this.kids[i] = this.branch();
      }
    } else{
      this.numKids = 0;
      this.kids = new Branch[this.numKids];
    }
      
  }
  
  Branch branch() {
    // generate a new direction
    float angle = random(-PI/5, PI/5);
    PVector dir = PVector.sub(this.end, this.begin);
    dir.mult(random(0.8, 0.98));
    dir.rotate(angle); 
    PVector newEnd = PVector.add(this.end, dir);
    return new Branch(this.end, newEnd, this.level + 1);
  }
  
  void render() {
    if(!this.drawn){
      //this.drawn = true;
      strokeWeight((10 - this.level) * 0.9);
      line(this.begin.x, this.begin.y, this.end.x, this.end.y);
      for(int i = 0; i < this.numKids; i++){
           this.kids[i].render();
      }
      strokeWeight(1);
      // check for leaf case
      if(this.numKids == 0){
        fill(255, 0, 100);
        noStroke();
        if(this.leafY < height-7){
          this.leafY += random(4, 7);
        }
        ellipse(this.end.x, this.leafY, 15,15);
        stroke(255);
      }
    }
  }
}
