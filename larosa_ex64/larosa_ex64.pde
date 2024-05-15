import javax.swing.JOptionPane;

void setup() {
  AddressBook contacts = new AddressBook();
  boolean shouldContinue = true;

  do {
    String choice = JOptionPane.showInputDialog("Inserisci un'opzione:\n"
      + "1) aggiungi un contatto;\n"
      + "2) visualizza tutti i contatti;\n"
      + "3) ricerca un contatto;\n"
      + "4) elimina un contatto;\n"
      + "5) termina il programma.");

    if (choice == null) {
      shouldContinue = false;
    } else {
      String firstName, lastName, phone;

      switch (choice) {
      case "1":
        firstName = JOptionPane.showInputDialog("Inserisci il nome del contatto:");

        if (firstName != null) {
          lastName = JOptionPane.showInputDialog("Inserisci il cognome del contatto:");

          if (lastName != null) {
            phone = JOptionPane.showInputDialog("Inserisci il numero di telefono del contatto:");

            if (phone != null) {
              Contact contact = contacts.addContact(firstName, lastName, phone);
              contact.display();
            }
          }
        }

        break;
      case "2":
        contacts.display();
        break;
      case "3":
        phone = JOptionPane.showInputDialog("Inserisci il numero di telefono del contatto:");

        if (phone != null) {
          Contact contact = contacts.findContact(phone);

          if (contact == null) {
            println("\nNessun contatto trovato.");
          } else {
            contact.display();
          }
        }

        break;
      case "4":
        phone = JOptionPane.showInputDialog("Inserisci il numero di telefono del contatto:");

        if (phone != null) {
          boolean exists = contacts.deleteContact(phone);

          if (exists) {
            println("\nContatto cancellato.");
          } else {
            println("\nNessun contatto trovato.");
          }
        }

        break;
      case "5":
        shouldContinue = false;
        break;
      default:
        println("\nOpzione non valida; riprova.");
      }
    }
  } while (shouldContinue);

  println("\nHai terminato il programma.");
}
