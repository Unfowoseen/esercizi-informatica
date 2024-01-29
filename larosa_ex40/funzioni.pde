int indexOf(String[] array, String value) {
  int index = -1;
  int i = 0;

  while (index < 0 && i < array.length) {
    if (array[i] != null && array[i].equals(value)) {
      index = i;
    }

    i++;
  }

  return index;
}

boolean guessDiceRoll(int nDice, String input) {
  int result = 0;
  int guess = int(input);

  for (int i = 0; i < nDice; i++) {
    result += (int) random(1, 7);
  }

  println("La somma dei dadi era: " + result);

  return result == guess;
}

boolean guessCoinFlip(String input) {
  int result = (int) random(0, 1);
  int guess = indexOf(coinSides, input.toLowerCase());

  println("La moneta è caduta di: " + coinSides[result]);

  return result == guess;
}

boolean guessColor(String input) {
  int result = (int) random(colors.length);
  int guess = indexOf(colors, input.toLowerCase());

  println("Il colore scelto era: " + colors[result]);

  return result == guess;
}
