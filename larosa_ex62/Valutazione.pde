class Valutazione {
  String data;
  String tipoProva;
  String argomento;
  float voto;

  Valutazione(String data, String tipoProva, String argomento, float voto) {
    this.data = data;
    this.tipoProva = tipoProva;
    this.argomento = argomento;
    this.voto = constrain(voto, 0, 10);
  }

  void stampa() {
    println("\nData: " + data);
    println("Tipo di prova: " + tipoProva);
    println("Argomento: " + argomento);
    println(String.format("Voto: %.1f", voto));
  }
}
