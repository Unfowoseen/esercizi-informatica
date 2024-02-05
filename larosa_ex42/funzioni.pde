int readInt(String message) {
  String input;

  do {
    input = JOptionPane.showInputDialog(message);
  } while (input == null);

  return int(input);
}

String readBinary(String message) {
  String input;

  do {
    input = JOptionPane.showInputDialog(message);
  } while (input == null || !Pattern.matches("^[01]+$", input));

  return input;
}

String intToBinary(int decimal) {
  String binary = "";
  int quotient = decimal;

  while (quotient > 0) {
    binary = (quotient % 2) + binary;
    quotient /= 2;
  }

  return binary.isEmpty() ? "0" : binary;
}

int binaryToInt(String binary) {
  int len = binary.length();
  int decimal = 0;

  for (int i = 0; i < len; i++) {
    if (binary.charAt(len - i - 1) == '1') {
      decimal += pow(2, i);
    }
  }

  return decimal;
}
