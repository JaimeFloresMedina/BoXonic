class bolita {
  //attributos
  float radio;
  Body boli;
  float x;
  float y;

  //constructor
  bolita (float x_, float y_, float radio_) {
    this.radio=radio_;
    x=x_;
    y=y_;

    BodyDef bodydef = new BodyDef();
    bodydef.type = BodyType.DYNAMIC;
    bodydef.position = box2d.coordPixelsToWorld(x, y);

    boli=box2d.createBody(bodydef);

    CircleShape bola = new CircleShape();
    float radioB2d = box2d.scalarPixelsToWorld(radio_/2);
    bola.m_radius = radioB2d;

    FixtureDef fixturedef = new FixtureDef();
    fixturedef.shape = bola;
    fixturedef.density =.1;
    fixturedef.friction =.9;
    fixturedef.restitution =.9;

    boli.createFixture(fixturedef);

    boli.setUserData(this);
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(this.boli);
    float ang =boli.getAngle();

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-ang);
    ellipseMode(CENTER);
    fill(0);
    noStroke();
    imageMode(CENTER);
    image(bola, 0, 0);

    popMatrix();
  }



  Vec2 pos() {
    Vec2 pr = box2d.getBodyPixelCoord(boli);
    return pr;
  }


  void acorde() {
    if (pause==false) {
      acorde.play();
    }
  }

  void nota1() {
    if (pause==false) {
      e1.play();
    }
  }
  void nota(int n) {
    if (pause==false) {
      switch (n) {
      case 0: 
        e3.play();
        break;
      case 1: 
        e4.play();
        break;
      case 2:
        gb.play();
        break;
      }
    }
  }
}
