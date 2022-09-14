import processing.sound.*;

int bpm = 120;
int framerate = 60;

float initTime;

SqrOsc osc, osc2;
Env env, env2;

Instrument instr, instr2;
PolyVisualizer viz, viz2;
Sequencer seq, seq2;

void setup() {
  initTime = millis();
  size(480, 480);
  frameRate(framerate);

  // init 1st track
  osc = new SqrOsc(this);
  env  = new Env(this);

  instr = new SquareInst(osc, env, 0.002, 0.00, 0.1);
  viz = new PolyVisualizer(4, 100);
  seq = new Sequencer(instr, viz, bpm);
  
  // init 2nd track
  osc2 = new SqrOsc(this);
  env2  = new Env(this);
  
  instr2 = new SquareInst(osc2, env2, 0.002, 0.00, 0.1);
  viz2 = new PolyVisualizer(5, 150);
  seq2 = new Sequencer(instr2, viz2, bpm);
}

void draw() {
  background(255);
  
  seq.drawAndUpdate();
  seq2.drawAndUpdate();
}
