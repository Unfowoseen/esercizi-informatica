class AddressBook {
  final int MAX_CONTACTS = 10;

  Contact[] contacts;

  AddressBook() {
    contacts = new Contact[MAX_CONTACTS];
  }

  void display() {
    if (findFirstNullIndex() == 0) {
      println("\nNessun contatto aggiunto.");
    } else {
      for (Contact contact : contacts) {
        if (contact != null) {
          contact.display();
        }
      }
    }
  }

  Contact addContact(String firstName, String lastName, String phone) {
    int index = findFirstNullIndex();

    if (index < 0) {
      return null;
    }

    Contact contact = new Contact(firstName, lastName, phone);
    contacts[index] = contact;

    return contact;
  }

  Contact findContact(String phone) {
    for (Contact contact : contacts) {
      if (contact != null && contact.phone.equals(phone)) {
        return contact;
      }
    }

    return null;
  }

  int findContactIndex(String phone) {
    for (int i = 0; i < contacts.length; i++) {
      Contact contact = contacts[i];

      if (contact != null && contact.phone.equals(phone)) {
        return i;
      }
    }

    return -1;
  }

  boolean deleteContact(String phone) {
    int index = findContactIndex(phone);

    if (index < 0) {
      return false;
    }

    contacts[index] = null;

    for (int i = index + 1; i < contacts.length; i++) {
      contacts[i - 1] = contacts[i];
      contacts[i] = null;
    }

    return true;
  }

  int findFirstNullIndex() {
    for (int i = 0; i < contacts.length; i++) {
      if (contacts[i] == null) {
        return i;
      }
    }

    return -1;
  }
}
