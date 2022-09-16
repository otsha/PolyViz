import processing.sound.*;

int bpm = 120;
int framerate = 60;

float initTime;

SqrOsc osc, osc2;
Env env, env2;

Clock clock;
Clock clock2;
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
  viz = new PolyVisualizer(4, 75);
  seq = new Sequencer(instr, viz, 4, 1.0/4.0);

  // init 2nd track
  osc2 = new SqrOsc(this);
  env2  = new Env(this);

  instr2 = new SquareInst(osc2, env2, 0.002, 0.00, 0.1);
  viz2 = new PolyVisualizer(3, 150);
  seq2 = new Sequencer(instr2, viz2, 3, 1.0/3.0);
  
  // init clock
  Sequencer[] sequencers = { seq, seq2 };
  clock = new Clock(initTime, bpm, sequencers);
}

void draw() {
  background(255);

  seq.drawAndPlay();
  seq2.drawAndPlay();

  thread("updateClock");
}

void updateClock() {
  clock.update();
}

void keyPressed() {
  if (keyCode == LEFT) {
    seq.toggle();
    seq2.toggle();
  }
}
