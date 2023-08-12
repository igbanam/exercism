import 'dart:math';

class Darts {
  num hypotenuse(num x, num y) {
    return sqrt(pow(x, 2) + pow(y, 2));
  }

  int score(num x, num y) {
    int result = 0;
    num h = hypotenuse(x, y);
    if (h <= 1.0) {
      result = 10;
    } else if (h <= 5.0) {
      result = 5;
    } else if (h <= 10.0) {
      result = 1;
    }
    return result;
  }
}
