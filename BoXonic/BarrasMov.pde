
class BarraMov {
  float x;
  float y;
  float ancho;
  float alto;
  Body b;
  float amp;
  color c;


  BarraMov(float x_, float y_, float ancho_, float alto_, color c_) {
    x = x_;
    y = y_;
    ancho = ancho_;
    alto = alto_;
    c=c_;


    PolygonShape bar = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(ancho/2);
    float box2dH = box2d.scalarPixelsToWorld(alto/2);
    bar.setAsBox(box2dW, box2dH);

    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    b = box2d.createBody(bd);

    FixtureDef fd = new FixtureDef();
    fd.shape = bar;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    b.createFixture(fd);

    b.setUserData(this);
  }
  void mover(float amp_) {

    this.amp=this.y+amp_;

    b.setTransform(new Vec2(box2d.coordPixelsToWorld(this.x, this.amp)), 0);
  }


  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(b);

    pushMatrix();
    translate(pos.x, pos.y);
    fill(c);
    noStroke();
    rectMode(CENTER);
    rect(0, 0, this.ancho, this.alto);
    popMatrix();
  }

  void e() {
    gb.play();
  }
}
