class LSystem {
  String sentence;
  Rule[] ruleset;
  int gen;

  LSystem(String axiom, Rule[] _ruleset) {
    sentence = axiom;
    ruleset = _ruleset;
    gen = 0;
  }

  void generate() {
    StringBuffer nextgen = new StringBuffer();

    for (int i = 0; i < sentence.length(); i++) {
      char c = sentence.charAt(i);
      String replace = "" + c;

      for (int j = 0; j < ruleset.length; j++) {
        char a = ruleset[j].getA();

        if (a == c) {
          replace = ruleset[j].getB();
          break;
        }
      }
      nextgen.append(replace);
    }

    sentence = nextgen.toString();
    gen++;
    color(gen * 30);
  }

  String getSentence() {
    return sentence;
  }

  int getGen() {
    return gen;
  }
}
