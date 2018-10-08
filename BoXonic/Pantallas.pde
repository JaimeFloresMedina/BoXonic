class Pantallas {

  void inicio() {

    image(fondo, 0, 0);
    text("(Solo da click en el area superior)", 210, 460);
    text("Presiona 'p' para Pausar", 230, 575);
    text("Presiona 's' para Terminar", 230, 590);
  }

  void boxonic() {

    //vio
    float amp_Hat = sum5 * (600/2) * 5;
    background(205+amp_Hat, 0+amp_Hat, 0);
    box2d.step();

    fill(0);
    quad(0, 600, 50, 600, 50, 420, 0, 380);
    quad(550, 600, 600, 600, 600, 400, 550, 450);

    b1.display();
    b2.display();
    b3.display();
    b4.display();
    b5.display();



    //kick
    sum1 += (ambase.analyze() - sum1) * frecBarr;
    float amp_base = sum1 * (500/2) * 5;
    //cencerro
    sum2 += (amCence.analyze() - sum2) * frecBarr;
    float amp_cence = sum2 * (600/2) * 5;
    //snare
    sum3 += (amSnare.analyze() - sum3) * frecBarr;
    float amp_snare = sum3 * (600/2) * 5;
    //shaker
    sum4 += (amShaker.analyze() - sum4) * frecBarr;
    float amp_shaker = sum4 * (600/2) * 5;
    sum5 += (amHat.analyze() - sum5) * frecBarr;
    float amp_hat = sum5 * (600/2) * 5;


    uno.mover(amp_base);
    uno.display();
    dos.mover(amp_cence);
    dos.display();
    tres.mover(amp_snare);
    tres.display();
    cuatro.mover(amp_shaker);
    cuatro.display();
    cinco.mover(amp_hat);
    cinco.display();

    e_.display();
    g.display();
    b.display();
    un1.display();
    un.display();

    for (int i =  bolitas.size()-1; i >= 0; i--) {
      bolita p = bolitas.get(i);
      p.display();
    }
    rectMode(CORNER);
    fill(random(230, 255), random(230, 255), random(230, 255), 40);
    rect(0, 0, 600, 100);
  }
}
