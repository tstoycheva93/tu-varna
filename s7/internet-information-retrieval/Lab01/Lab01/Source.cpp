#include <iostream>
using namespace std;

void ascending(int array[], int size) {
  for (int step = 0; step < size -1; ++step) {
    for (int i = 0; i < size - step - 1; ++i) {
      if (array[i] > array[i + 1]) {
        int temp = array[i];
        array[i] = array[i + 1];
        array[i + 1] = temp;
      }
    }
  }
}

void descending(int array[], int size) {
  for (int step = 0; step < size -1; ++step) {
    for (int i = 0; i < size - step - 1; ++i) {
      if (array[i] < array[i + 1]) {
        int temp = array[i];
        array[i] = array[i + 1];
        array[i + 1] = temp;
      }
    }
  }
}


void printArray(int array[], int size) {
  for (int i = 0; i < size; ++i) {
    cout << "  " << array[i];
  }
  cout << "\n";
}



int main() {
    cout << "Hello World!\n";

	int data[] = {781,55,6,3,1,4,999,10598,-5,-11};
  
  int size = sizeof(data) / sizeof(data[0]);
  
  ascending(data, size);
  
  cout << "Ascending Order:\n";
  printArray(data, size);
  cout << "\n";

  descending(data, size);
  cout << "Descending Order:\n";
  printArray(data, size);
  cout << "\n";

	getchar();
    return 0;
}

