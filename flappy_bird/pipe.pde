class Pipe{
  float x;
  float w = 40;
  float top;
  float bottom;
  float pipe_speed = 3;
  
  Pipe(){
    x = wid + w;
    top = random(100, height/2);
    bottom = random(100, height/2);
  }
  
  boolean hits(Bird b){
    if ((b.pos.x > x) && (b.pos.x < (x + w)))  // bird lies within width of the pipe
    {
      if ((b.pos.y < (top + b.r)) || (b.pos.y > (height - bottom - b.r)))  // bird is below upper pipe and above the lower pipe
      {
        return true;
      }
    }
    return false;
  }
  
  void update(){
    x = x - pipe_speed;
  }
  
  void show(boolean hit){
    stroke(0, 0, 0);
    strokeWeight(2);
    if (hit){
      fill(217, 74, 30, 200);
    }
    else{
      fill(65, 224, 129, 250);
    }
    rect(x, 0, w, top);  // upper pipe
    rect(x, height - bottom, w, bottom);  // lower pipe 
  }
  
}
