class Lista {
  final int MAX_PRODOTTI = 10;

  Prodotto[] prodotti;

  Lista() {
    prodotti = new Prodotto[MAX_PRODOTTI];
  }

  // Aggiunge un prodotto alla lista.
  // Restituisce false se la lista è piena oppure esiste già un altro prodotto con lo stesso nome, altrimenti true.
  boolean aggiungiProdotto(Prodotto prodotto) {
    int indice = trovaPrimoIndiceNull();

    if (indice < 0 || prodotto == null || trovaIndiceProdotto(prodotto.nome) >= 0) {
      return false;
    }

    prodotti[indice] = prodotto;

    return true;
  }

  // Rimuove un prodotto dalla lista e sposta gli altri elementi per riempire lo spazio vuoto.
  // Restituisce false se nella lista non esiste un prodotto di nome `nomeProdotto`, altrimenti true.
  boolean rimuoviProdotto(String nomeProdotto) {
    int indice = trovaIndiceProdotto(nomeProdotto);

    if (indice < 0) {
      return false;
    }

    prodotti[indice] = null;

    for (int i = indice + 1; i < prodotti.length; i++) {
      prodotti[i - 1] = prodotti[i];
      prodotti[i] = null;
    }

    return true;
  }

  // Restituisce il primo indice in cui viene trovato un prodotto di nome `nomeProdotto`, o -1 se non esiste.
  int trovaIndiceProdotto(String nomeProdotto) {
    for (int i = 0; i < prodotti.length; i++) {
      Prodotto prodotto = prodotti[i];

      if (prodotto != null && prodotto.nome.equals(nomeProdotto)) {
        return i;
      }
    }

    return -1;
  }

  // Stampa in console tutti gli elementi non null della lista.
  void stampaListaSpesa() {
    if (trovaPrimoIndiceNull() == 0) {
      println("\nNessun prodotto inserito.");
    } else {
      for (Prodotto prodotto : prodotti) {
        if (prodotto != null) {
          prodotto.stampa();
        }
      }
    }
  }

  // Restituisce la somma dei prezzi unitari di ogni prodotto moltiplicati per la rispettiva quantità.
  float calcolaTotale() {
    float totale = 0;

    for (Prodotto prodotto : prodotti) {
      if (prodotto != null) {
        totale += prodotto.prezzo * prodotto.quantità;
      }
    }

    return totale;
  }

  // Restituisce il primo indice "libero" in cui viene trovato null, o -1 se la lista è piena.
  int trovaPrimoIndiceNull() {
    for (int i = 0; i < prodotti.length; i++) {
      if (prodotti[i] == null) {
        return i;
      }
    }

    return -1;
  }
}
