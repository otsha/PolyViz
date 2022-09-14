abstract class Instrument {
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

  public abstract void trigger(float freq);
  public abstract void stop();
}
