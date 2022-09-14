class SquareInst extends Instrument {
  SqrOsc oscillator;
  
  SquareInst(SqrOsc osc, Env env, float a, float s, float r) {
    super(env, a, s, r);
    oscillator = osc;
  }
  
  public void trigger(float freq) {
    this.oscillator.play();
    this.oscillator.freq(freq);
    this.envelope.play(this.oscillator, this.attack, this.sustain, 0.5, this.release);
  }
}
