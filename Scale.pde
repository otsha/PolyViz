class Scale {
  float[] notes = {
    Note.C.oct(4),
    Note.D.oct(4),
    Note.E.oct(4),
    Note.F.oct(4),
    Note.G.oct(4),
    Note.A.oct(4),
    Note.B.oct(4)
  };
  
  public float note(int i) {
    return notes[i];
  }
  
  public int len() {
    return notes.length;
  }
}
