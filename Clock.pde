class Clock {
  private int bpm;
  private float previousTime;
  private ArrayList<Sequencer> sequencers;

  Clock(float initTime, int bpm, ArrayList<Sequencer> sequencers) {
    this.previousTime = initTime;
    this.bpm = bpm;
    this.sequencers = sequencers;
  }

  public void update() {
    float stepInterval = (frameRate * 1.0 / this.bpm) * 1000.0;
    float m = millis();

    if (m - this.previousTime >= stepInterval) {
      
      for (Sequencer s : this.sequencers) {
        s.step(); 
      }
      
      this.previousTime = m;
    }
  }
}
