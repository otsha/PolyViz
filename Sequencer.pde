class Sequencer { //<>//
  private int steps, currentStep;
  private float div;
  private float counter, t;
  private Instrument instrument;
  private PolyVisualizer visualizer;
  private boolean playing;
  private Scale scale;

  Sequencer(Instrument i, PolyVisualizer v, int nOfSteps, float division) {
    this.instrument = i;
    this.visualizer = v;
    this.steps = nOfSteps;
    this.div = division;
    this.currentStep = 1;
    this.counter = 0;
    this.t = 8;
    this.playing = false;
    this.scale = new Scale(220);
  }

  private void step() {
    if (this.playing == true) {
      this.instrument.trigger(scale.note(round(random(0, 7))));
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
