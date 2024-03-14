boolean isSorted(int[] arr) {
  for (int i = 1; i < arr.length; i++) {
    if (arr[i] < arr[i - 1]) {
      return false;
    }
  }

  return true;
}

void miracleSort(int[] arr) {
  boolean sorted = false;

  // controlla se l'array è ordinato finché non è ordinato
  do {
    sorted = isSorted(arr);
  } while (!sorted);
}

void bogoSort(int[] arr) {
  // mescola l'array finché non è ordinato
  do {
    for (int i = 0; i < arr.length; i++) {
      int rand = (int) random(arr.length);
      int temp = arr[rand];

      arr[rand] = arr[i];
      arr[i] = temp;
    }
  } while (!isSorted(arr));
}

void selectionSort(int[] arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    int min = i;

    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[min]) {
        min = j;
      }
    }

    int temp = arr[min];
    arr[min] = arr[i];
    arr[i] = temp;
  }
}
