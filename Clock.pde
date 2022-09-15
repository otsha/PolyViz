import java.util.LinkedList;

class Clock {
  private int bpm, tpb;
  private float previousTime, interval;
  private LinkedList<Float> drift;
  private Sequencer[] sequencers;

  Clock(float initTime, int bpm, Sequencer[] sequencers) {
    this.previousTime = initTime;
    this.bpm = bpm;
    this.sequencers = sequencers;
    this.drift = new LinkedList<Float>();
    
    /* Calculate clock tick interval (ms)
    *  TPB = ticks per beat - essentially the max resolution/granularity of the clock 
    *  values lower than 48 start slowing time - investigate (sequencer) */
    this.tpb = 128;
    int ticksPerMinute = this.bpm * this.tpb;
    this.interval = (60.0 / ticksPerMinute) * 1000.0;
  }
  
  /**
  *  Send a signal to all sequencers on each tick.
  *  Adjust tick interval based on potential drift.
  */
  public void update() {
    float deltaTime = millis() - this.previousTime;
    float adjustment = driftAdjustment();
    if (deltaTime >= this.interval - adjustment) {
      float tickDrift = deltaTime - this.interval;
      drift.addLast(tickDrift);

      for (Sequencer s : this.sequencers) {
        s.signal(this.bpm, this.tpb);
      }
      
      this.previousTime = millis();
    }
  }
 
  /**
  *  Calculate and return an adjustment value to counter clock drift.
  *  The value is calculated as the average drift of the last 32 ticks.
  *  @return The adjustment value
  */
  private float driftAdjustment() {
    if (drift.size() == 0) {
      return 0.0; 
    } else if (drift.size() == 1) {
      return drift.get(0); 
    } else if (drift.size() > 32) {
      drift.removeFirst();
    }
    
    float sum = drift.stream().reduce(0.0, (a, b) -> a + b);
    
    return sum / drift.size();
  }
}
