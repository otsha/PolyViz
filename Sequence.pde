import java.util.LinkedList;

class Sequence {
  private LinkedList<Note> notes;
  
  Sequence() {
    this.notes = new LinkedList<Note>(); 
  }
  
  public void add(Note note) {
    this.notes.add(note);
  }
  
  public void addAll(Note[] newNotes) {
    for (Note n : newNotes) {
      this.notes.add(n); 
    }
  }
  
  public Note next() {
    if (notes.size() > 0) {
      Note next = this.notes.poll();
      this.notes.addLast(next);
      return next;
    }
    
    return Note.A;
  }
  
  public int length() {
    return this.notes.size(); 
  }
}
