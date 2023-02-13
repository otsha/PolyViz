import processing.sound.*;

int bpm = 120;
int framerate = 60;

float initTime;

Clock clock;
Sequencer seq, seq2, seq3;

Sequence steps, steps2, steps3;

void setup() {
  initTime = millis();
  size(480, 480);
  frameRate(framerate);

  Step[] s = {
    new Step(Note.C, 2, 0.05, 0.0, 1.0),
    new Step(Note.C, 2, 0.05, 0.0, 1.0),
    new Step(Note.G, 2, 0.05, 0.0, 1.0),
  };
  steps = new Sequence();
  steps.addAll(s);

  Step[] s2 = {
    new Step(Note.C, 4),
    new Step(Note.E, 4),
    new Step(Note.G, 4),
    new Step(Note.B, 4)
  };
  steps2 = new Sequence();
  steps2.addAll(s2);

  Step[] s3 = {
    new Step(Note.C, 3, 0.05, 0.0, 1.0),
    new Step(Note.E, 4, 0.05, 0.0, 1.0),
    new Step(Note.G, 3, 0.05, 0.0, 1.0),
    new Step(Note.C, 4, 0.05, 0.0, 1.0),

  };
  steps3 = new Sequence();
  steps3.addAll(s3);

  // init tracks
  seq = new Sequencer(this, OscType.TRI, steps, 75, 3, 1.0/3.0);
  seq2 = new Sequencer(this, OscType.SIN, steps2, 150, 4, 1.0/4.0);
  seq3 = new Sequencer(this, OscType.TRI, steps3, 225, 5, 5.0/3.0);


  // init clock
  Sequencer[] sequencers = { seq, seq2, seq3 };
  clock = new Clock(initTime, bpm, sequencers);
}

void draw() {
  background(255);

  seq.drawAndPlay();
  seq2.drawAndPlay();
  seq3.drawAndPlay();

  thread("updateClock");
}

void updateClock() {
  clock.update();
}

void keyPressed() {
  if (keyCode == LEFT) {
    seq.toggle();
    seq2.toggle();
    seq3.toggle();
  }
}
