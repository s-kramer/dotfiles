#include <vector>
#include <iostream>

int main() {
  std::vector<int> numbers;
  for (std::vector<int>::iterator it = numbers.begin(), end = numbers.end();
       it != end; ++it) {
    std::cout << *it;
  }
}
