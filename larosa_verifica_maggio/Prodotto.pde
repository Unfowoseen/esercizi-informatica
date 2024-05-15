class Prodotto {
  String nome;
  int quantità;
  float prezzo;

  Prodotto(String nome, int quantità, float prezzo) {
    this.nome = nome;
    this.quantità = quantità;
    this.prezzo = prezzo;
  }

  // Stampa in console le informazioni del prodotto.
  void stampa() {
    println("\nNome: " + nome);
    println("Quantità: " + quantità);
    println(String.format("Prezzo: %.2f €", prezzo));
  }
}
