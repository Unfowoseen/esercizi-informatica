/**
 * Imposta un limite per il ciclo ottenendo il valore minimo tra la lunghezza del nome e la lunghezza massima
 * del codice a barre, ignorando così i caratteri in eccesso.
 * Assegna alle celle dell'array il mod 10 del codice del carattere che si trova all'indice corrispondente nel nome.
 * Genera la cifra di controllo tramite la funzione generaCifraControllo e la assegna all'ultima cella dell'array.
 */
int[] generaCodiceBarre(String name) {
  int[] codeDigits = new int[CODE_LENGTH];
  int len = min(name.length(), CODE_LENGTH - 1);

  for (int i = 0; i < len; i++) {
    int charCode = (int) name.charAt(i);
    codeDigits[i] = charCode % 10;
  }

  codeDigits[CODE_LENGTH - 1] = generaCifraControllo(codeDigits);

  return codeDigits;
}

/**
 * Restituisce false immediatamente se la stringa non ha lunghezza uguale a 13 o contiene valori non numerici.
 * Costruisce un array di interi dalla stringa e ne confronta l'ultimo elemento con il risultato di generaCifraControllo.
 */
boolean check(String productCode) {
  if (productCode.length() != CODE_LENGTH || isNaN(productCode)) {
    return false;
  }

  int[] codeDigits = new int[CODE_LENGTH];

  for (int i = 0; i < codeDigits.length; i++) {
    codeDigits[i] = Character.getNumericValue(productCode.charAt(i));
  }

  return generaCifraControllo(codeDigits) == codeDigits[codeDigits.length - 1];
}

/**
 * Per ogni elemento `n` nell'array, somma al risultato (n * 3) se l'indice è pari, altrimenti (n * 2).
 * Restituisce il risultato mod 10.
 */
int generaCifraControllo(int[] codeDigits) {
  int result = 0;

  for (int i = 0; i < codeDigits.length - 1; i++) {
    if (i % 2 == 0) {
      result += codeDigits[i] * 3;
    } else {
      result += codeDigits[i] * 2;
    }
  }

  return result % 10;
}

/**
 * Cicla i caratteri della stringa ed esce dalla funzione con true se almeno un carattere è fuori dal range 48-57.
 */
boolean isNaN(String input) {
  for (int i = 0; i < input.length(); i++) {
    char character = input.charAt(i);
    if (character < '0' || character > '9') {
      return true;
    }
  }

  return false;
}
