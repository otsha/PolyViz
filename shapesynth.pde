import processing.sound.*;

int bpm = 120;
int framerate = 60;

float initTime;

SqrOsc osc, osc2;
Env env, env2;

Clock clock;
Clock clock2;
MainClock mainClock;
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
  seq = new Sequencer(instr, viz, 4);

  // init clock for track 1
  ArrayList<Sequencer> sequencers = new ArrayList<Sequencer>();
  sequencers.add(seq);
  clock = new Clock(initTime, bpm, sequencers);

  // init 2nd track
  osc2 = new SqrOsc(this);
  env2  = new Env(this);

  instr2 = new SquareInst(osc2, env2, 0.002, 0.00, 0.1);
  viz2 = new PolyVisualizer(5, 150);
  seq2 = new Sequencer(instr2, viz2, 5);

  // init clock for track 2
  ArrayList<Sequencer> sequencers2 = new ArrayList<Sequencer>();
  sequencers2.add(seq2);
  clock2 = new Clock(initTime, 90, sequencers2);

  // init mainclock to run 16 steps per beat
  ArrayList<Clock> clocks = new ArrayList<Clock>();
  clocks.add(clock);
  clocks.add(clock2);
  mainClock = new MainClock(initTime, bpm * 16, clocks);
}

void draw() {
  background(255);

  seq.draw();
  seq2.draw();

  thread("updateClocks");
  thread("updateMainClock");
}

void updateClocks() {
  clock.update();
  clock2.update();
}

void updateMainClock() {
   mainClock.update();
}
