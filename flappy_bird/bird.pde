class Bird{
  PVector pos;
  PVector vel;
  PVector acc;
  float r = 16;
  
  Bird(){
    pos = new PVector(50, height/2);
    vel = new PVector(0, 0);
    acc = new PVector();
  }
  
  void applyForce(PVector force){
    acc.add(force);
  }
  
  void update(){
    applyForce(gravity);
    pos.add(vel);
    vel.add(acc);
    vel.limit(4);
    acc.mult(0);
    
    // whether bird is trying to escape screen
    if(pos.y > height){
      pos.y = height;      // stopping it at edge
      vel.mult(0);
    }
  }
  
  void show(){
    stroke(0, 0, 0);       // colour of outline
    strokeWeight(2);       // thickness of outline
    fill(224, 218, 34);
    ellipse(pos.x, pos.y, r*2, r*2);
  }
  
}
