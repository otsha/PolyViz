enum Note {
  C(16.35),
  CSharp(17.32),
  D(18.35),
  DSharp(19.45),
  E(20.60),
  F(21.83),
  FSharp(23.12),
  G(24.50),
  GSharp(25.96),
  A(27.50),
  ASharp(29.14),
  B(30.87);
  
  
  private float frequency;
  Note(float freq) {
    this.frequency = freq;
  }
  
  float oct(int octave) {
    return this.frequency * pow(2, octave); 
  }
}
