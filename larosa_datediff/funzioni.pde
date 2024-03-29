boolean isLeapYear(int year) {
  return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
}

boolean isValidDate(int d, int m, int y) {
  int[] yearDays = getYearDays(y);

  return y > 1582 && m > 0 && m < yearDays.length && d > 0 && d <= yearDays[m];
}

boolean isNaN(String input) {
  for (int i = 0; i < input.length(); i++) {
    char character = input.charAt(i);
    if (character < 48 || character > 57) {
      return true;
    }
  }

  return false;
}

int[] getFormattedDate(String input) {
  if (input == null || input.length() != 10 || input.charAt(2) != '/' || input.charAt(5) != '/') {
    return null;
  }

  String[] tokens = input.split("/", 3);

  for (int i = 0; i < tokens.length; i++) {
    if (isNaN(tokens[i])) {
      return null;
    }
  }

  int d = int(tokens[0]), m = int(tokens[1]), y = int(tokens[2]);

  if (!isValidDate(d, m, y)) {
    return null;
  }

  return new int[] {d, m, y};
}

int[] getYearDays(int year) {
  int[] days = new int[13];
  boolean isLeap = isLeapYear(year);

  for (int i = 1; i < days.length; i++) {
    switch (i) {
    case 4:
    case 6:
    case 9:
    case 11:
      days[i] = 30;
      break;
    case 2:
      days[i] = isLeap ? 29 : 28;
      break;
    default:
      days[i] = 31;
    }
  }

  return days;
}

int getDaysSinceJan1st(int d, int m, int y) {
  int[] yearDays = getYearDays(y);
  int days = 0;

  for (int i = 1; i < m; i++) {
    days += yearDays[i];
  }

  return days + d;
}

int getDaysBetweenDates(int d1, int m1, int y1, int d2, int m2, int y2) {
  if (!isValidDate(d1, m1, y1) || !isValidDate(d2, m2, y2)) {
    return -1;
  }

  int daysSince1 = getDaysSinceJan1st(d1, m1, y1);
  int daysSince2 = getDaysSinceJan1st(d2, m2, y2);
  int days = -daysSince1;

  for (int i = y1; i < y2; i++) {
    days += isLeapYear(i) ? 366 : 365;
  }

  return days + daysSince2;
}
