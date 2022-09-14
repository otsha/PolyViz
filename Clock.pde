class Clock {
  private int bpm;
  private float previousTime, mainTime;
  private ArrayList<Sequencer> sequencers;

  Clock(float initTime, int bpm, ArrayList<Sequencer> sequencers) {
    this.previousTime = initTime;
    this.bpm = bpm;
    this.sequencers = sequencers;
  }
  
  public void setTime(float m) {
    this.mainTime = m;
  }

  public void update() {
    float stepInterval = (frameRate * 1.0 / this.bpm) * 1000.0;

    if (this.mainTime - this.previousTime >= stepInterval) {
      
      for (Sequencer s : this.sequencers) {
        s.step(); 
      }
      this.previousTime = this.mainTime;
    }
  }
}
