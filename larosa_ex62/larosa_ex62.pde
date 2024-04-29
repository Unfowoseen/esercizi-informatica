import javax.swing.JOptionPane;

void setup() {
  IndiceStudenti indiceStudenti = new IndiceStudenti();
  boolean continuaScelta = true;

  do {
    String scelta = JOptionPane.showInputDialog("Inserisci un'opzione:\n"
      + "1) inserisci uno studente;\n"
      + "2) inserisci i voti di uno studente;\n"
      + "3) visualizza i dati di uno studente;\n"
      + "4) stampa la lista degli studenti;\n"
      + "5) termina il programma.");

    if (scelta == null) {
      continuaScelta = false;
    } else {
      switch (scelta) {
      case "1":
        {
          String nome = JOptionPane.showInputDialog("Inserisci il nome dello studente:");
          String cognome = JOptionPane.showInputDialog("Inserisci il cognome dello studente:");
          String classe = JOptionPane.showInputDialog("Inserisci la classe dello studente:");

          if (nome == null || cognome == null || classe == null) {
            println("\nHai annullato l'inserimento.");
          } else {
            Studente studente = indiceStudenti.aggiungiStudente(nome, cognome, classe);

            if (studente == null) {
              println("\nIl numero massimo di studenti è già stato inserito.");
            } else {
              studente.stampa();
            }
          }
        }

        break;
      case "2":
        {
          String matricola = JOptionPane.showInputDialog("Inserisci la matricola dello studente:");

          if (matricola == null) {
            println("\nHai annullato l'inserimento.");
          } else {
            Studente studente = indiceStudenti.trovaStudente(matricola);

            if (studente == null) {
              println("\nNessuno studente corrisponde alla matricola che hai inserito.");
            } else {
              boolean continuaInserimento = true;
              int indice = trovaPrimoIndiceNull(studente.valutazioni);

              if (indice < 0) {
                println("\nIl numero massimo di valutazioni per questo studente è già stato inserito.");
              } else {
                do {
                  String prefisso = "(" + (indice + 1) + "/" + studente.valutazioni.length + ") ";
                  String data = JOptionPane.showInputDialog(prefisso + "Inserisci la data della valutazione:");
                  String tipoProva = JOptionPane.showInputDialog(prefisso + "Inserisci il tipo di prova:");
                  String argomento = JOptionPane.showInputDialog(prefisso + "Inserisci l'argomento della prova:");
                  String votoS = JOptionPane.showInputDialog(prefisso + "Inserisci il voto:");

                  if (data == null || tipoProva == null || argomento == null || votoS == null) {
                    continuaInserimento = false;
                  } else {
                    float voto = float(votoS);

                    if (Float.isNaN(voto)) {
                      println("\n" + prefisso + "Il voto deve essere un numero.");
                    } else {
                      Valutazione valutazione = studente.aggiungiValutazione(data, tipoProva, argomento, voto);
                      if (valutazione == null) {
                        continuaInserimento = false;
                        println("\nIl numero massimo di valutazioni per questo studente è già stato inserito.");
                      } else {
                        valutazione.stampa();
                        indice++;
                      }
                    }
                  }
                } while (continuaInserimento && indice < studente.valutazioni.length);

                println("\nHai terminato l'inserimento dei voti.");
              }
            }
          }
        }

        break;
      case "3":
        {
          String matricola = JOptionPane.showInputDialog("Inserisci la matricola dello studente:");

          if (matricola == null) {
            println("\nHai annullato l'inserimento.");
          } else {
            Studente studente = indiceStudenti.trovaStudente(matricola);

            if (studente == null) {
              println("\nNessuno studente corrisponde alla matricola che hai inserito.");
            } else {
              studente.stampa();
              studente.stampaValutazioni();
              println("\nMedia generale: " + studente.calcolaMediaVoti());
            }
          }
        }

        break;
      case "4":
        indiceStudenti.stampaStudenti();
        break;
      case "5":
        continuaScelta = false;
        break;
      default:
        println("\nScelta non valida; riprova.");
      }
    }
  } while (continuaScelta);

  println("\nHai terminato il programma.");
}

<T> int trovaPrimoIndiceNull(T[] vec) {
  for (int i = 0; i < vec.length; i++) {
    if (vec[i] == null) {
      return i;
    }
  }

  return -1;
}
