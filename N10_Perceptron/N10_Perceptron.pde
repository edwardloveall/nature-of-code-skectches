Perceptron ptron;
Trainer[] training = new Trainer[2000];
int count = 0;

void setup() {
  size(700, 400);
  stroke(0);

  ptron = new Perceptron(3);

  for (int i = 0; i < training.length; i++) {
    float x = random(-width * 0.5, width * 0.5);
    float y = random(-height * 0.5, height * 0.5);
    int answer = (y < f(x)) ? -1 : 1;

    training[i] = new Trainer(x, y, answer);
  }
}

void draw() {
  background(255);

  translate(width * 0.5, height * 0.5);
  ptron.train(training[count].inputs, training[count].answer);
  count = (count + 1) % training.length;

  for (int i = 0; i < count; i++) {
    int guess = ptron.feedForward(training[i].inputs);
    if (guess > 0) {
      noFill();
    } else {
      fill(0);
    }

    ellipse(training[i].inputs[0], training[i].inputs[1], 8, 8);
  }
}

float f(float x) {
  return 2 * x + 1;
}
