import javax.swing.JOptionPane;
import java.util.regex.Pattern;

void setup() {
  boolean shouldExit = false;
  int choice;

  do {
    int decimal = -1;
    String binary = null;

    choice = readInt("Inserisci un'opzione:\n"
      + "1) Converti un numero decimale in binario;\n"
      + "2) Converti un numero binario in decimale;\n"
      + "3) Esci.");

    switch (choice) {
    case 1:
      do {
        decimal = readInt("Inserisci un numero decimale da convertire in binario");
      } while (decimal < 0);

      binary = intToBinary(decimal);

      break;
    case 2:
      binary = readBinary("Inserisci un numero binario da convertire in decimale");
      decimal = binaryToInt(binary);

      break;
    default:
      shouldExit = true;
    }

    if (!shouldExit) {
      println("Decimale: " + decimal);
      println("Binario: " + binary);
    }
  } while (!shouldExit);
}

void draw() {
}
