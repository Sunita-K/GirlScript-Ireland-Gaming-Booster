Bird b = new Bird();
ArrayList<Pipe> pipes = new ArrayList<Pipe>();
int wid = 400;
int rez = 20;
int score = 0;
boolean jumping = false;
PVector gravity = new PVector(0, 0.5);
PImage nature;

void setup(){
  size(400, 800);
  b = new Bird();
  pipes.add(new Pipe());
  nature = loadImage("/assets/background.jpg");
}

void draw(){
  background(0, 0, 0);
  image(nature, 0, 0);
  if (frameCount % 75 == 0)
  {
    pipes.add(new Pipe());
  }
  if (keyPressed)
  {   // space key
    PVector up = new PVector(0, -5);
    b.applyForce(up);
  }
  
  b.update();
  b.show();
  boolean safe = true;
  
  for (int i = pipes.size() - 1; i >= 0; i--)
  {
    Pipe p = pipes.get(i);
    p.update();
    if (p.hits(b))
    {
      p.show(true);
      safe = false;
    }
    else
    {
      p.show(false);
    }
    
    if(p.x < -p.w)
    {
      pipes.remove(i);
    }
  }

if (safe)
{
  score++;
}
else
{
  score = score - 50;
}

fill(16, 53, 201);  // colour of text
textSize(64);

text(score, width/2, 50);
score = constrain(score, 0, score);
}
