class Manager {
  String firstName;
  String lastName;
  String taxCode;
  String emailAddress;
  String workPhone;
  float grossIncome;
  String carModel;
  float carValue;

  Manager(
    String firstName,
    String lastName,
    String taxCode,
    String emailAddress,
    String workPhone,
    float grossIncome,
    String carModel,
    float carValue
    ) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.taxCode = taxCode;
    this.emailAddress = emailAddress;
    this.workPhone = workPhone;
    this.grossIncome = grossIncome;
    this.carModel = carModel;
    this.carValue = carValue;
  }

  void printfln(String format, Object... args) {
    println(String.format(format, args));
  }

  void display() {
    printfln("Nome: %s %s", lastName, firstName);
    println("Codice fiscale: " + taxCode);
    printfln("Recapito: %s, %s", emailAddress, workPhone);
    println("Modello automobile: " + carModel);
  }

  void displayMore(boolean useGrossIncome) {
    display();

    if (useGrossIncome) {
      printfln("Stipendio lordo: %.1f", grossIncome);
      printfln("Valore automobile: %.1f", carValue);
    } else {
      printfln("Stipendio netto: %.1f", computeNetIncome());
    }
  }

  float computeNetIncome() {
    return grossIncome - (grossIncome + carValue) / 100.0 * 30.0;
  }
}
