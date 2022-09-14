class PolyVisualizer {
  private PShape shape;
  private int radius, vIndex;

  PolyVisualizer(int n, int r) {
    this.vIndex = 0;

    this.radius = r;
    float rot = 0;
    float inc = (2 * PI) / n;

    this.shape = createShape();
    this.shape.beginShape();
    this.shape.noFill();
    this.shape.strokeWeight(2);
    for (int i = 0; i < n; i++) {
      this.shape.vertex(
        0 - (this.radius * sin(rot)),
        0 - (this.radius * cos(rot))
        );
      rot += inc;
    }
    this.shape.endShape(CLOSE);
  }

  public void draw(int x, int y) {
    shape(this.shape, x, y);

    strokeWeight(2);
    for (int i = 0; i < this.shape.getVertexCount(); i++) {
      PVector point = this.shape.getVertex(i);

      if (i == this.vIndex) {
        fill(255, 75, 125);
      } else {
        noFill();
      }

      circle(x + point.x, y + point.y, 20);
    }
  }

  public void advance() {
    if (this.vIndex < this.shape.getVertexCount() - 1) {
      this.vIndex++;
    } else {
      this.vIndex = 0; 
    }
  }
}
