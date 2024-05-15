import javax.swing.JOptionPane;

void setup() {
  Lista lista = new Lista();
  boolean continua = true;

  do {
    String scelta = JOptionPane.showInputDialog("Inserisci un'opzione:\n"
      + "1) aggiungi un prodotto alla lista;\n"
      + "2) rimuovi un prodotto dalla lista dato il nome;\n"
      + "3) stampa la lista della spesa;\n"
      + "4) stampa il totale della spesa;\n"
      + "5) termina il programma.");

    if (scelta == null) {
      continua = false;
    } else {
      switch(scelta) {
      case "1":
        {
          String nome = JOptionPane.showInputDialog("Inserisci il nome del prodotto:");

          if (nome == null) {
            println("\nHai annullato l'inserimento."); // Il newline all'inizio della stampa facilita la formattazione
          } else {
            int quantità = leggiInt("Inserisci la quantità del prodotto:");

            if (quantità < 1) {
              println("\nHai annullato l'inserimento.");
            } else {
              float prezzo = leggiFloat("Inserisci il prezzo unitario del prodotto:");

              if (Float.isNaN(prezzo)) {
                println("\nHai annullato l'inserimento.");
              } else {
                Prodotto prodotto = new Prodotto(nome, quantità, prezzo);
                boolean risultato = lista.aggiungiProdotto(prodotto);

                if (risultato) {
                  println("\nIl prodotto " + nome + " è stato aggiunto.");
                } else {
                  if (lista.trovaPrimoIndiceNull() < 0) {
                    println("\nLa lista è piena.");
                  } else {
                    println("\nIl prodotto " + nome + " esiste già.");
                  }
                }
              }
            }
          }
        }

        break;
      case "2":
        {
          String nome = JOptionPane.showInputDialog("Inserisci il nome del prodotto:");

          if (nome == null) {
            println("\nHai annullato l'inserimento.");
          } else {
            boolean risultato = lista.rimuoviProdotto(nome);

            if (risultato) {
              println("\nIl prodotto " + nome + " è stato rimosso.");
            } else {
              println("\nIl prodotto " + nome + " non esiste.");
            }
          }
        }

        break;
      case "3":
        lista.stampaListaSpesa();
        break;
      case "4":
        println(String.format("\nTotale: %.2f €", lista.calcolaTotale()));
        break;
      case "5":
        continua = false;
        break;
      default:
        println("\nScelta non valida; riprova.");
      }
    }
  } while (continua);

  println("\nHai terminato il programma.");
}

// Legge un numero intero valido da tastiera.
// I valori di restituzione minori di 1 indicano che l'utente ha cancellato l'inserimento.
int leggiInt(String messaggio) {
  String input;
  int valore = 0;

  do {
    input = JOptionPane.showInputDialog(messaggio);

    if (input != null && !Float.isNaN(float(input))) {
      valore = int(input);
    }
  } while (input != null && valore < 1);

  return valore;
}

// Legge un numero decimale valido da tastiera.
// Restituisce Float.NaN se l'utente ha cancellato l'inserimento, altrimenti l'input convertito in float.
float leggiFloat(String messaggio) {
  String input;
  float valore = Float.NaN;

  do {
    input = JOptionPane.showInputDialog(messaggio);

    if (input != null) {
      valore = float(input);
    }
  } while (input != null && Float.isNaN(valore));

  return valore;
}
