class Sequencer {
  private int steps, currentStep;
  private double counter;
  private Instrument instrument;
  private PolyVisualizer visualizer;
  private boolean playing;

  Sequencer(Instrument i, PolyVisualizer v, int nOfSteps) {
    this.instrument = i;
    this.visualizer = v;
    this.steps = nOfSteps;
    this.currentStep = 1;
    this.counter = 0;
    this.playing = false;
  }

  private void step() {
    if (this.playing == true) {
      this.instrument.trigger(221);
      this.visualizer.advance();

      if (currentStep < steps) {
        this.currentStep++;
      } else {
        this.currentStep = 1;
      }
    }
  }

  public void signal(int bpm) { //<>//
    float increment = lerp(0.0, 1.0 * bpm, 1.0 / this.steps); //<>// //<>// //<>// //<>// //<>//
    this.counter += increment; //<>// //<>// //<>//
  } //<>//

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
    if (this.counter >= bpm) {
      this.step();
      this.counter = 0;
    } 
  }
}
