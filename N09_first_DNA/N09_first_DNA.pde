float mutationRate;
int totalPopulation = 150;

DNA[] population;
ArrayList<DNA> matingPool;
String target;

void setup() {
  size(700, 400);

  target = "to be or not to be";
  mutationRate = 0.001;

  population = new DNA[totalPopulation];
  for (int i = 0; i < population.length; i++) {
    population[i] = new DNA();
  }
}

void draw() {
  background(255);

  for (int i = 0; i < population.length; i++) {
    population[i].fitness();
    println(population[i].getPhrase());
  }

  ArrayList<DNA> matingPool = new ArrayList<DNA>();

  for (int i = 0; i < population.length; i++) {
    int n = int(population[i].fitness * 100);
    for (int j = 0; j < n; j++) {
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
