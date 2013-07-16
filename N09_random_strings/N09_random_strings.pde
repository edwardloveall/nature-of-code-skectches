StringBuffer s = new StringBuffer(20);
String characters = "abcdefghijklmnopqrstuvwxyz";

void setup() {
  size(700, 400);
}

void draw() {
  background(255);

  for (int i = 0; i < 20; i++) {
    int charIndex = int(random(characters.length()));
    s.replace(i, i+1, String.valueOf(characters.charAt(charIndex)));
  }

  println(s);
}
