class MainClock {
  private int bpm;
  private float previousTime;
  private ArrayList<Clock> clocks;

  MainClock(float initTime, int bpm, ArrayList<Clock> clocks) {
    this.previousTime = initTime;
    this.bpm = bpm;
    this.clocks = clocks;
    this.update();
  }

  public void update() {
    float stepInterval = (frameRate * 1.0 / this.bpm) * 1000.0;
    float m = millis();

    if (m - this.previousTime >= stepInterval) {
      
      for (Clock c : this.clocks) {
         c.setTime(m);
      }
      
      this.previousTime = m;
    }
  }
}
