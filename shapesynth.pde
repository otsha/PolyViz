import processing.sound.*;

int bpm;
SqrOsc osc;
Env env;

Instrument instrument;

void setup() {
  size(480, 480);
  bpm = round(random(90,140));
  
  osc = new SqrOsc(this);
  env  = new Env(this);
  
  instrument = new SquareInst(osc, env, 0.002, 0.02, 0.5);
}

void draw() {
  background(0);
}

void mouseClicked() {
  instrument.trigger(221);
}
