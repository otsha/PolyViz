class Sequencer { //<>//
  private float div, counter, stepLength;
  private boolean playing;
  private Instrument instrument;
  private PolyVisualizer visualizer;
  private Sequence steps;

  Sequencer(PApplet app, OscType type, Sequence sequence, int vizSize, int vizPoints, float division) {
    this.div = division;

    this.instrument = new Instrument(initOsc(app, type), new Env(app), 0.002, 0.00, 0.1);
    this.visualizer = new PolyVisualizer(vizPoints, vizSize);

    this.counter = 0;
    this.stepLength = 0;
    this.playing = false;
    this.steps = sequence;
  }

  private Oscillator initOsc(PApplet app, OscType type) {
    switch (type) {
    case SAW:
      return new SawOsc(app);
    case SIN:
      return new SinOsc(app);
    case SQR:
      return new SqrOsc(app);
    case TRI:
      return new TriOsc(app);
    default:
      return new SinOsc(app);
    }
  }

  private void step() {
    if (this.playing == true) {
      this.instrument.trigger(steps.next().oct(4));
      this.visualizer.advance();
    }
  }

  public void signal(int bpm, int tpb) {
    this.stepLength = (tpb * div * bpm);

    float mul = bpm / 120.0;

    //println("mul " + pow(mul, 2));
    //println("inc " + tpb * pow(mul, 2));

    this.counter += tpb * pow(mul, 2);
  }

  public void toggle() {
    this.playing = !this.playing;
    this.instrument.stop();
    this.counter = 0;
  }

  public void draw() {
    this.visualizer.draw(width / 2, height / 2);
  }

  public void drawAndPlay() {
    this.draw();
    if (this.counter >= this.stepLength) {
      this.step();
      this.counter = 0;
    }
  }
}
