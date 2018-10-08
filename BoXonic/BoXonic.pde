
import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import processing.sound.*;

//algunas formulas de analisis de audio estan basadas en ejemplos de processing

SoundFile base, mel, col, cence, snare, shaker, hat, vio, gb, e, e1, g_, acorde, e3, e4;
Amplitude ambase, amCol, amCence, amSnare, amShaker, amHat, amVio;
Box2DProcessing box2d;
Barra un, un1, b3, b4, b5 ;
BarraLim b1, b2;
BarraMov uno, dos, tres, cuatro, cinco;
Piano  e_, g, b;

Pantallas inicio, boxonic;





PImage bola;
PImage ps;
ArrayList <bolita> bolitas;
ArrayList <BarraMov> barras;
float frecBarr = .1;
float sum1, sum2, sum3, sum4, sum5, sum6 ;
int limite=0;
int pantalla=0;
PImage fondo;
boolean pause =false;



void setup() {
  size(600, 600);

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.listenForCollisions();
  box2d.setGravity(0, -100);
  bolitas = new ArrayList <bolita>();
  barras = new ArrayList <BarraMov>();

  inicio=new Pantallas();
  boxonic=new Pantallas();
  fondo = loadImage("fondo.png");

  uno=new BarraMov(100, 400, 100, 500, #FFFF64);
  dos=new BarraMov(200, 320, 100, 500, #FF7300);
  tres=new BarraMov(300, 400, 100, 500, #FFFF64);
  cuatro=new BarraMov(400, 400, 100, 500, #FF7300);
  cinco=new BarraMov(500, 600, 100, 500, #FFFF64);


  un = new Barra(600, 300, 20, 600, 0, 0);
  un1 = new Barra(0, 300, 20, 600, 0, 0);
  b1 = new BarraLim(580, 420, 10, 80, PI/4, 0);
  b2 = new BarraLim(5, 400, 10, 100, 2*PI/3, 0);
  b3 = new Barra(45, 510, 10, 180, 0, 0);
  b4 = new Barra(554, 535, 10, 180, 0, 0);
  b5 = new Barra(300, 0, 600, 10, 0, 0);





  bola = loadImage("bola.png");
  ps = loadImage("pause.png");

  base = new SoundFile(this, "kick.wav");
  mel = new SoundFile(this, "e.wav");
  col = new SoundFile(this, "col.wav"); 
  cence = new SoundFile(this, "cence.wav");
  snare = new SoundFile(this, "snare.wav");
  shaker = new SoundFile(this, "shaker.wav");
  hat = new SoundFile(this, "hat.wav");
  vio = new SoundFile(this, "fondo.wav");
  gb = new SoundFile(this, "bass.wav");
  e = new SoundFile(this, "b.wav");
  e3 = new SoundFile(this, "e3.wav");
  e4 = new SoundFile(this, "e4.wav");
  e1 = new SoundFile(this, "e1.wav");
  g_ = new SoundFile(this, "g.wav");
  acorde = new SoundFile(this, "acorde.wav");


  base.loop();  
  cence.loop();
  snare.loop();
  shaker.loop();
  hat.loop();
  vio.loop();

  ambase = new Amplitude(this);
  ambase.input(base);
  amCol = new Amplitude(this);
  amCol.input(col);
  amCence = new Amplitude(this);
  amCence.input(cence);
  amSnare = new Amplitude(this);
  amSnare.input(snare);
  amShaker = new Amplitude(this);
  amShaker.input(shaker);
  amHat = new Amplitude(this);
  amHat.input(hat);
  amVio = new Amplitude(this);
  amVio.input(vio);




  e_ = new Piano(20, 125, 100, 30, 230, PI/4);
  g = new Piano(300, 110, 100, 30, 210, PI/4);
  b = new Piano(590, 125, 100, 30, 190, -PI/4);
}


void mousePressed() {


  if (pantalla==1) {
    if (mouseX>0 && mouseX < width && mouseY >0 && mouseY <100) {
      limite++;
      if (limite<6) {

        bolitas.add(  new bolita(mouseX, mouseY, 20));
        mel.play();
      }
    }
  }
}

void keyPressed() {
  if (pantalla ==0) {
    if (key=='\n') {
      pantalla=1;
    }
  }
  if (pantalla ==1) {

    if (key=='p' ||key=='P') {
      if (pause==false) {


        base.stop();  
        cence.stop();
        snare.stop();
        shaker.stop();
        hat.stop();
        vio.stop();
        pause=true;
      } else {
        redraw();
        pause=false;
        base.loop();  
        cence.loop();
        snare.loop();
        shaker.loop();
        hat.loop();
        vio.loop();
      }
    }
    if (key=='s' ||key=='S') {
      exit();
    }
  }
}

void draw () {

  if (pantalla==0) {
    inicio.inicio();
  }
  if (pantalla==1) {

    boxonic.boxonic();
    if (pause==true) {
      image(ps, 250, 300);
    }
  }
}



void beginContact(Contact cp) {
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();

  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
  if (pause==false) {
    if (o1.getClass() == Barra.class) {
      bolita p = (bolita) o2;
      p.nota(int(random(3)));
    } 



    if (o1.getClass() == Piano.class) {
      bolita p = (bolita) o2;
      p.acorde();
    } 

    if (o1.getClass() == bolita.class && o2.getClass() == bolita.class) {
      bolita p1 = (bolita) o1;
      p1.nota1();
    }
  }
}

void endContact(Contact cp) {
}
