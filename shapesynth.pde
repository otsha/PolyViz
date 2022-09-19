import processing.sound.*;

int bpm = 120;
int framerate = 60;

float initTime;

Clock clock;
Sequencer seq, seq2;

Sequence steps;
Sequence steps2;

void setup() {
  initTime = millis();
  size(480, 480);
  frameRate(framerate);

  Step[] s = {
    new Step(Note.C, 3, 0.01, 0.0, 0.5),
    new Step(Note.E, 3),
    new Step(Note.G, 3),
  };
  steps = new Sequence();
  steps.addAll(s);

  Step[] s2 = {
    new Step(Note.B, 4),
    new Step(Note.G, 4),
    new Step(Note.E, 4),
    new Step(Note.C, 4)
  };
  steps2 = new Sequence();
  steps2.addAll(s2);

  // init tracks
  seq = new Sequencer(this, OscType.SIN, steps, 75, 3, 1.0/3.0);
  seq2 = new Sequencer(this, OscType.SAW, steps2, 150, 16, 1.0/16.0);

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
