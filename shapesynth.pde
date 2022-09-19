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
  
  Note[] notes = { Note.C, Note.E, Note.G, Note.B };
  steps = new Sequence();
  steps.addAll(notes);

  Note[] notes2 = { Note.B, Note.G, Note.E, Note.C };
  steps2 = new Sequence();
  steps2.addAll(notes2);

  // init tracks
  seq = new Sequencer(this, OscType.SQR, steps, 75, 3, 1.0/3.0);
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
