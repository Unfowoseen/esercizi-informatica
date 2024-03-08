import java.util.Arrays;

void setup() {
  int[] arr = {19, 10, 4, 8, 3};

  println(Arrays.toString(arr));
  selectionSort(arr);
  println(Arrays.toString(arr));
}
