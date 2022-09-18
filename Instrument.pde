class Instrument {
  Oscillator oscillator;
  Env envelope;
  float attack, sustain, release;

  Instrument(Oscillator osc, Env env, float a, float s, float r) {
    this.oscillator = osc;
    this.envelope = env;
    this.attack = a;
    this.sustain = s;
    this.release = r;
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
