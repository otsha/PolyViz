import java.util.LinkedList;

class Sequence {
  private LinkedList<Step> steps;
  
  Sequence() {
    this.steps = new LinkedList<Step>(); 
  }
  
  public void add(Step step) {
    this.steps.add(step);
  }
  
  public void addAll(Step[] newSteps) {
    for (Step n : newSteps) {
      this.steps.add(n); 
    }
  }
  
  public Step next() {
    if (steps.size() > 0) {
      Step next = this.steps.poll();
      this.steps.addLast(next);
      return next;
    }
    
    return new Step(Note.A, 0, 0.001, 0.00, 0.1);
  }
  
  public int length() {
    return this.steps.size(); 
  }
}
