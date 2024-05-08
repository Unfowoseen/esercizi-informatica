class IndiceStudenti {
  static final int N_STUDENTI = 10;

  Studente[] studenti;

  IndiceStudenti() {
    studenti = new Studente[N_STUDENTI];
  }

  Studente aggiungiStudente(String nome, String cognome, String classe) {
    int indice = trovaPrimoIndiceNull(studenti);
    if (indice < 0 || nome == null || cognome == null || classe == null) {
      return null;
    }

    Studente studente = new Studente(nome, cognome, classe);
    studenti[indice] = studente;

    return studente;
  }

  Studente trovaStudente(String matricola) {
    for (Studente studente : studenti) {
      if (studente != null && studente.matricola.equals(matricola)) {
        return studente;
      }
    }

    return null;
  }

  void stampaStudenti() {
    if (trovaPrimoIndiceNull(studenti) == 0) {
      println("\nNessuno studente inserito.");
    } else {
      for (Studente studente : studenti) {
        if (studente != null) {
          studente.stampa();
        }
      }
    }
  }
}
