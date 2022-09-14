class Sequencer {
  private float stepInterval, pTime;
  private Instrument instrument;
  private PolyVisualizer visualizer;

  Sequencer(Instrument i, PolyVisualizer v, int bpm) {
    this.instrument = i;
    this.visualizer = v;
    this.stepInterval = (frameRate * 1.0 / bpm) * 1000.0;
    this.pTime = millis();
  }

  private void update() {
    this.stepInterval = (frameRate * 1.0 / bpm) * 1000.0;
    float m = millis();

    if (m - pTime >= stepInterval) {
      this.instrument.trigger(221);
      this.visualizer.advance();
      this.pTime = m;
    }
  }

  public void drawAndUpdate() {
    this.visualizer.draw(width / 2, height / 2);
    this.update();
  }
}
