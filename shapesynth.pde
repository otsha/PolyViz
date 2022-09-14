import processing.sound.*;

int bpm = 120;
int framerate = 60;

float beatInterval, previousTime;

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
}

void draw() {
  background(0);
  
  float m = millis();
  
  if (m - previousTime >= beatInterval) {
    instrument.trigger(221);
    previousTime = m;
  }
}
