double cube(double x) => x * x * x;

double task2(double a) {
  double t1 = a;
  double t2 = cube(t1); 
  double t3 = cube(t2); 
  double t4 = cube(t3); 
  
  return t1 + t2 + t3 + t4;
}

void main() {
  double a = 2.0;
  
  double result = task2(a);
  print('a = 2');
  print('Результат: $result'); 
}