import javax.swing.JOptionPane;

final int KEY_MIN = 1, KEY_MAX = 25;

void setup() {
  String[][] loginInfo = new String[5][2];
  int[] shifts = new int[loginInfo.length];
  boolean shouldContinue = true;

  do {
    String choice = JOptionPane.showInputDialog("Inserisci un'opzione:\n"
      + "1) effettua la registrazione;\n"
      + "2) effettua il login con nome utente e password;\n"
      + "3) visualizza le credentiali inserite nel registro;\n"
      + "4) termina il programma.");

    if (choice == null) {
      shouldContinue = false;
    } else {
      String username, password;

      switch (choice) {
      case "1":
        username = JOptionPane.showInputDialog("Inserisci il nome utente:");
        if (username != null) {
          password = JOptionPane.showInputDialog("Inserisci la password:");
          if (password != null) {
            if (password.matches("^[A-Z]+$")) {
              boolean result = registerUser(loginInfo, shifts, username, password);
              if (!result) {
                println("L'utente è già registrato oppure il registro è pieno.");
              }
            } else {
              println("Password non valida; puoi inserire soltanto lettere maiuscole.");
            }
          } else {
            println("Hai annullato l'inserimento.");
          }
        } else {
          println("Hai annullato l'inserimento.");
        }

        break;
      case "2":
        username = JOptionPane.showInputDialog("Inserisci il nome utente:");
        if (username != null) {
          password = JOptionPane.showInputDialog("Inserisci la password:");
          if (password != null) {
            int index = getUserIndex(loginInfo, username);
            if (index < 0) {
              println("Login fallito; l'utente non esiste.");
            } else {
              if (password.equals(decryptString(loginInfo[index][1], shifts[index]))) {
                println("Login effettuato.");
              } else {
                println("Login fallito; la password è errata.");
              }
            }
          } else {
            println("Hai annullato l'inserimento.");
          }
        } else {
          println("Hai annullato l'inserimento.");
        }

        break;
      case "3":
        if (getFirstAvailableIndex(loginInfo) == 0) {
          println("Il registro è vuoto.");
        } else {
          for (int i = 0; i < loginInfo.length; i++) {
            String[] user = loginInfo[i];
            int shift = shifts[i];

            if (user.length == 2 && user[0] != null && user[1] != null) {
              println(user[0], user[1], decryptString(user[1], shift), shift);
            }
          }
        }

        break;
      case "4":
        shouldContinue = false;
        break;
      default:
        println("Opzione non valida; riprova.");
      }
    }
  } while (shouldContinue);

  println("Hai terminato il programma.");
}
