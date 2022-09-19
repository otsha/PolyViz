import processing.sound.*;

int bpm = 120;
int framerate = 60;

float initTime;

Clock clock;
Sequencer seq, seq2;

void setup() {
  initTime = millis();
  size(480, 480);
  frameRate(framerate);

  // init tracks
  seq = new Sequencer(this, OscType.TRI, 75, 4, 1.0/4.0);
  seq2 = new Sequencer(this, OscType.TRI, 150, 7, 1.0/7.0);
  
  // init clock
  Sequencer[] sequencers = { seq };
  clock = new Clock(initTime, bpm, sequencers);
}

void draw() {
  background(255);

  seq.drawAndPlay();
  //seq2.drawAndPlay();

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
