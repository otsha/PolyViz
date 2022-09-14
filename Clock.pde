class Clock {
  private int bpm;
  private float previousTime;
  private Sequencer[] sequencers;

  Clock(float initTime, int bpm, Sequencer[] sequencers) {
    this.previousTime = initTime;
    this.bpm = bpm;
    this.sequencers = sequencers;
  }

  public void update() {
    float stepInterval = (60 * 1.0 / (this.bpm * 16)) * 1000.0;

    if (millis() - this.previousTime >= stepInterval) {

      for (Sequencer s : this.sequencers) {
        s.signal(this.bpm);
      }
      
      this.previousTime = millis();
    }
  }
}
