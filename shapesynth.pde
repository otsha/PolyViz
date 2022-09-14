import processing.sound.*;

int bpm = 120;
int framerate = 60;

float beatInterval, previousTime;

PolyVisualizer viz;
SqrOsc osc;
Env env;

Instrument instrument;

void setup() {
  previousTime = millis();
  size(480, 480);
  frameRate(framerate);

  // Calculate time between beats in milliseconds
  beatInterval = (framerate * 1.0 / bpm) * 1_000.0;
  
  osc = new SqrOsc(this);
  env  = new Env(this);
  
  instrument = new SquareInst(osc, env, 0.002, 0.00, 0.1);
  viz = new PolyVisualizer(4, 100);
}

void draw() {
  background(255);

  float m = millis();
  
  viz.draw(width / 2, height / 2);
  
  if (m - previousTime >= beatInterval) {
    instrument.trigger(221);
    viz.advance();
    previousTime = m;
  }
}
