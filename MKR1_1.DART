import 'dart:math';

double task1(double x, int n) {
  double sum = 0.0;
  double sinVal = sin(x);
  double currentTerm = 1.0;

  for (int i = 1; i <= n; i++) {
    currentTerm *= sinVal; 
    sum += currentTerm;
  }
  return sum;
}

void main() {
  double x = pi / 6; 
  int n = 3;
  
  double result = task1(x, n);
  print('x = 30 град, n = 3');
  print('Результат: $result'); 
}