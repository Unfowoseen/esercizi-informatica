void miracleSort(int[] arr) {
  boolean sorted = false;

  do {
    sorted = true;

    for (int i = 1; i < arr.length; i++) {
      if (arr[i] < arr[i - 1]) {
        sorted = false;
      }
    }
  } while (!sorted);
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
