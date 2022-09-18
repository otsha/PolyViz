class Sequencer { //<>//
  private int steps, currentStep;
  private float div;
  private float counter, t;
  private Instrument instrument;
  private PolyVisualizer visualizer;
  private boolean playing;
  private Scale scale;

  Sequencer(PApplet app, OscType type, int vizSize, int nOfSteps, float division) {
    this.steps = nOfSteps;
    this.div = division;

    this.instrument = new Instrument(initOsc(app, type), new Env(app), 0.002, 0.00, 0.1);
    this.visualizer = new PolyVisualizer(this.steps, vizSize);
    
    this.currentStep = 1;
    this.counter = 0;
    this.t = 8;
    this.playing = false;
    this.scale = new Scale();
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
      this.instrument.trigger(scale.note(round(random(0, scale.len() - 1))));
      this.visualizer.advance();

      if (currentStep < steps) {
        this.currentStep++;
      } else {
        this.currentStep = 1;
      }
    }
  }

  public void signal(int bpm, int tpb) {
    this.t = (tpb * bpm * div);
    this.counter += tpb;
  }

  public void toggle() {
    this.playing = !this.playing;
    this.instrument.stop();
    this.currentStep = 1;
    this.counter = 0;
  }

  public void draw() {
    this.visualizer.draw(width / 2, height / 2);
  }

  public void drawAndPlay() {
    this.draw();
    if (this.counter >= this.t) {
      this.step();
      this.counter = 0;
    }
  }
}
