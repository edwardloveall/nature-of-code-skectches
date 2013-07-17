class DNA {
  char [] genes;
  float fitness;

  DNA() {
    genes = new char[target.length()];
    for (int i = 0; i < genes.length; i++) {
      genes[i] = (char) random(32, 128);
    }
  }

  void fitness() {
    for (int i = 0; i < genes.length; i++) {
      if (genes[i] == target.charAt(i)) {
        fitness++;
      }
    }
  }

  DNA crossover(DNA partner) {
    DNA child = new DNA();

    int midpoint = int(random(genes.length));
    for (int i = 0; i < genes.length; i++) {
      if (random(1) > 0.5) {
        child.genes[i] = genes[i];
      } else {
        child.genes[i] = partner.genes[i];
      }
    }
    return child;
  }

  void mutate(float rate) {
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < rate) {
        genes[i] = (char) random(32, 128);
      }
    }
  }

  String getPhrase() {
    return new String(genes);
  }
}
