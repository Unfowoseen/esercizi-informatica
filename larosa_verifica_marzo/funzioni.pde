// Restituisce il primo indice del database che corrisponde alla coppia di username e password data.
int trovaIndice(String[][] database, String nomeUtente, String password) {
  if (database != null && nomeUtente != null && password != null) {
    for (int i = 0; i < database.length; i++) {
      String[] user = database[i];

      if (user.length == 2 && nomeUtente.equals(user[0]) && password.equals(user[1])) {
        return i;
      }
    }
  }

  return -1;
}

// Restituisce true se l'username dato è presente al 0esimo indice di una delle righe del database.
boolean doesUsernameExist(String[][] database, String username) {
  if (database != null && username != null) {
    for (String[] user : database) {
      if (user.length == 2 && username.equals(user[0])) {
        return true;
      }
    }
  }

  return false;
}

// Restituisce il primo indice del database che non contiene sia username che password non null.
// Utilizzata per trovare il primo indice non occupato in cui può essere inserito un nuovo utente.
int getFirstNullIndex(String[][] database) {
  if (database != null) {
    for (int i = 0; i < database.length; i++) {
      String[] user = database[i];

      if (user.length != 2 || user[0] == null || user[1] == null) {
        return i;
      }
    }

    return database.length;
  }

  return -1;
}
