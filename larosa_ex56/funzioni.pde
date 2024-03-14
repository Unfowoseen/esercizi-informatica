int getUserIndex(String[][] loginInfo, String username) {
  if (username == null) {
    return -1;
  }

  for (int i = 0; i < loginInfo.length; i++) {
    String[] user = loginInfo[i];

    if (user.length == 2 && username.equalsIgnoreCase(user[0])) {
      return i;
    }
  }

  return -1;
}

boolean registerUser(String[][] loginInfo, int[] shifts, String username, String password) {
  if (username == null || password == null) {
    return false;
  }

  int index = getFirstAvailableIndex(loginInfo);

  if (index < 0 || getUserIndex(loginInfo, username) >= 0) {
    return false;
  }

  loginInfo[index] = new String[] {username, encryptString(shifts, password, index)};

  return true;
}

String encryptString(int[] shifts, String input, int index) {
  if (input == null || shifts.length <= index) {
    return null;
  }

  int shift = (int) random(KEY_MIN, KEY_MAX + 1);
  String result = "";

  input = input.toUpperCase();
  shifts[index] = shift;

  for (int i = 0; i < input.length(); i++) {
    int replacement = (input.charAt(i) + shift - 'A') % 26 + 'A';

    result += (char) replacement;
  }

  return result;
}

String decryptString(String input, int shift) {
  if (input == null) {
    return null;
  }

  String result = "";
  input = input.toUpperCase();

  for (int i = 0; i < input.length(); i++) {
    int replacement = (input.charAt(i) - shift + 'A') % 26 + 'A';

    result += (char) replacement;
  }

  return result;
}

int getFirstAvailableIndex(String[][] loginInfo) {
  for (int i = 0; i < loginInfo.length; i++) {
    String[] user = loginInfo[i];

    if (user.length == 2 && (user[0] == null || user[1] == null)) {
      return i;
    }
  }

  return -1;
}
