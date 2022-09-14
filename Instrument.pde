abstract class Instrument {
  Env envelope;
  float attack, sustain, release;
  
  Instrument(Env env, float a, float s, float r) {
    this.attack = a;
    this.sustain = s;
    this.release = r;
    this.envelope = env;
  }
  
  public abstract void trigger(float freq);
}
