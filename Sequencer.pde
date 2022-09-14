class Sequencer {
  private int steps, currentStep;
  private Instrument instrument;
  private PolyVisualizer visualizer;

  Sequencer(Instrument i, PolyVisualizer v, int nOfSteps) {
    this.instrument = i;
    this.visualizer = v;
    this.steps = nOfSteps;
    this.currentStep = 1;
  }

  public void step() {
    this.instrument.trigger(221);
    this.visualizer.advance();
    
    if (currentStep < steps) {
      this.currentStep++; 
    } else {
      this.currentStep = 1; 
    }
  }

  public void draw() {
    this.visualizer.draw(width / 2, height / 2);
  }
}
