class Studente {
  static final int N_VALUTAZIONI = 15;
  static final int LEN_MATRICOLA = 5;

  String nome;
  String cognome;
  String matricola;
  String classe;
  Valutazione[] valutazioni;

  Studente(String nome, String cognome, String classe) {
    this.nome = nome;
    this.cognome = cognome;
    this.classe = classe;
    matricola = generaMatricola();
    valutazioni = new Valutazione[N_VALUTAZIONI];
  }

  void stampa() {
    println("\nNome: " + nome + " " + cognome);
    println("Matricola: " + matricola);
    println("Classe: " + classe);
  }

  void stampaValutazioni() {
    if (trovaPrimoIndiceNull(valutazioni) == 0) {
      println("\nNessuna valutazione inserita.");
    } else {
      for (Valutazione valutazione : valutazioni) {
        if (valutazione != null) {
          valutazione.stampa();
        }
      }
    }
  }

  Valutazione aggiungiValutazione(String data, String tipoVoto, String argomento, float voto) {
    int indice = trovaPrimoIndiceNull(valutazioni);
    if (indice < 0 || data == null || tipoVoto == null || argomento == null) {
      return null;
    }

    Valutazione valutazione = new Valutazione(data, tipoVoto, argomento, voto);
    valutazioni[indice] = valutazione;

    return valutazione;
  }

  float calcolaMediaVoti() {
    float dividendo = 0;
    int divisore = trovaPrimoIndiceNull(valutazioni);

    for (int i = 0; i < divisore; i++) {
      dividendo += valutazioni[i].voto;
    }

    return (divisore != 0) ? (dividendo / divisore) : 0;
  }

  String generaMatricola() {
    StringBuilder builder = new StringBuilder();

    for (int i = 0; i < LEN_MATRICOLA; i++) {
      builder.append((int) random(1, 10));
    }

    return builder.toString();
  }
}
