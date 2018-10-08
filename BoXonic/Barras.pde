
class Barra {
  float x;
  float y;
  float ancho;
  float alto;
  float r;
  Body b;
  color c;

  Barra(float x_, float y_, float ancho_, float alto_, float r_, color c_) {
    x = x_;
    y = y_;
    ancho = ancho_;
    alto = alto_;
    r=r_;
    c=c_;


    PolygonShape bar = new PolygonShape();

    float box2dW = box2d.scalarPixelsToWorld(ancho/2);
    float box2dH = box2d.scalarPixelsToWorld(alto/2);
    bar.setAsBox(box2dW, box2dH);
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(0, 0);
    b = box2d.createBody(bd);
    b.createFixture(bar, 1);
    b.setUserData(this);
    b.setTransform(new Vec2(box2d.coordPixelsToWorld(x, y)), -r);
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(b);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(r);
    fill(c);
    noStroke();
    rectMode(PConstants.CENTER);
    rect(0, 0, this.ancho, this.alto);
    popMatrix();
  }
}
