class Scale {
  float[] notes;
  float[] maj = {1.0, 9.0/8.0, 5.0/4.0, 4.0/3.0, 3.0/2.0, 5.0/3.0, 15.0/8.0, 2.0};
  
  Scale(int base) {
    notes = new float[8];
    
    for (int i = 0; i < notes.length; i++) {
      notes[i] = base * maj[i];
    }
  }
  
  public float note(int i) {
    return notes[i];
  }
}
