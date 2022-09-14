class SquareInst extends Instrument {
  
  SquareInst(SqrOsc osc, Env env, float a, float s, float r) {
    super(osc, env, a, s, r);
  }
  
  public void trigger(float freq) {
    this.oscillator.play();
    this.oscillator.freq(freq);
    this.envelope.play(this.oscillator, this.attack, this.sustain, 0.5, this.release);
  }
  
  public void stop() {
    this.oscillator.stop();
  }
}
