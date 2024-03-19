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

int linearSearch(int[] arr, int searchElement) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == searchElement) {
      return i;
    }
  }

  return -1;
}

int binarySearch(int[] arr, int searchElement) {
  selectionSort(arr);

  int left = 0, right = arr.length;

  while (left <= right) {
    int middle = (left + right) / 2;

    if (searchElement == arr[middle]) {
      return middle;
    } else if (searchElement > arr[middle]) {
      left = middle + 1;
    } else {
      right = middle - 1;
    }
  }

  return -1;
}
