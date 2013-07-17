float mutationRate;
int totalPopulation = 150;

DNA[] population;
ArrayList<DNA> matingPool;
String target;

void setup() {
  size(700, 400);
  colorMode(HSB, 360, 1.0, 1.0);
  noStroke();

  target = "We all evolve eventually";
  mutationRate = 0.005;

  population = new DNA[totalPopulation];
  for (int i = 0; i < population.length; i++) {
    population[i] = new DNA();
  }

}

void draw() {
  background(0, 0, 1);

  for (int i = 0; i < population.length; i++) {
    population[i].fitness();
  }

  float best = 0;
  int bestI = 0;

  for (int i = 0; i < population.length; i++) {
    if (population[i].fitness > best) {
      best = population[i].fitness;
      bestI = i;
    }
  }

  float totalFit = best / target.length();
  float hue = map(totalFit, 0, 1, 0, 120);
  fill(hue, 0.8, 0.9);
  ellipse(width/2, height/2, height * totalFit, height * totalFit);
  println(population[bestI].getPhrase());

  if (totalFit == 1) {
    noLoop();
  }


  ArrayList<DNA> matingPool = new ArrayList<DNA>();

  for (int i = 0; i < population.length; i++) {
    // int n = int(population[i].fitness * 100);
    for (int j = 0; j < population[i].fitness; j++) {
      matingPool.add(population[i]);
    }
  }

  for (int i = 0; i < population.length; i++) {
    int a = int(random(matingPool.size()));
    int b = a;

    while(b == a) {
      b = int(random(matingPool.size()));
    }

    DNA partnerA = matingPool.get(a);
    DNA partnerB = matingPool.get(b);
    DNA child = partnerA.crossover(partnerB);

    child.mutate(mutationRate);

    population[i] = child;
  }
}
