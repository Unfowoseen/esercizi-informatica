import javax.swing.JOptionPane;

void setup() {
  float diameter = readFloat("Inserisci il diametro della ruota");
  float nRounds = readFloat("Inserisci il numero di giri");
  float velocity = computeVelocity(diameter, nRounds);

  println(velocity + " km/h");
}

void draw() {
}
