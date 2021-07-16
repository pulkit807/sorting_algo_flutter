import 'package:sorting_visual/sort_data.dart';

class MergeSort extends Sort {
  MergeSort() : super();
  int left = -1;
  int right = -1;

  @override
  void getData() {
    super.getData();
    left = -1;
    right = -1;
    sorted = 50;
    notifyListeners();
  }

  @override
  Future startSorting() async {
    if (isSorting) return;
    isSorting = true;
    if (sorted == 0) {
      this.getData();
    }
    final List<double> copy = List<double>.from(array);
    print("merge");
    await mergeSort(array, 0, array.length - 1, copy);
    if (!isSorting) return;
    sorted = 0;
    left = -1;
    right = -1;
    isSorting = false;
    notifyListeners();
  }

  Future mergeSort(List arr, int low, int high, List copy) async {
    if (!isSorting) return;
    if (low == high) return;
    final mid = (low + high) ~/ 2;
    await mergeSort(copy, low, mid, arr);
    await mergeSort(copy, mid + 1, high, arr);
    await merge(arr, low, mid, high, copy);
  }

  Future merge(List arr, int low, int mid, int high, List copy) async {
    if (!isSorting) return;
    print("merge $low $mid $high");
    left = low;
    right = mid + 1;
    int i = low;
    notifyListeners();
    while (left <= mid && right <= high) {
      if (copy[left] < copy[right]) {
        // if (!isSorting) return;
        arr[i++] = copy[left++];
      } else {
        // if (!isSorting) return;
        arr[i++] = copy[right++];
      }
      notifyListeners();
      await sleep();
    }
    while (left <= mid) {
      // if (!isSorting) return;
      arr[i++] = copy[left++];
      notifyListeners();
      await sleep();
    }
    while (right <= high) {
      // if (!isSorting) return;
      arr[i++] = copy[right++];
      notifyListeners();
      await sleep();
    }
  }
}
