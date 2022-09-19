class Instrument {
  Oscillator oscillator;
  Env envelope;

  Instrument(Oscillator osc, Env env) {
    this.oscillator = osc;
    this.envelope = env;
  }

  public void trigger(Step s) {
    this.oscillator.play();
    this.oscillator.freq(s.note().oct(s.octave()));
    this.envelope.play(this.oscillator, s.attack(), s.sustain(), 0.5, s.release());
  }
  
  public void stop() {
    this.oscillator.stop();
  }
}
