class Step {
  private Note note;
  private int octave;
  private float attack, sustain, release;
  
  Step(Note n, int oct, float a, float s, float r) {
    this.note = n;
    this.octave = oct;
    this.attack = a;
    this.sustain = s;
    this.release = r;
  }
  
  Step(Note n, int oct) {
    this(n, oct, 0.001, 0.0, 0.1); 
  }
  
  public Note note() {
    return this.note;
  }
  
  public int octave() {
    return this.octave; 
  }
  
  public float attack() {
    return this.attack; 
  }
  
  public float sustain() {
    return this.sustain; 
  }
  
  public float release() {
    return this.release; 
  }
}
