class Contact {
  String firstName;
  String lastName;
  String phone;

  Contact(String firstName, String lastName, String phone) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.phone = phone;
  }

  void display() {
    println("\nNome: " + lastName + " " + firstName);
    println("Telefono: " + phone);
  }
}
