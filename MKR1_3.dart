import 'dart:io';

class Rectangle {
  double width;
  double height;

  Rectangle([this.width = 0, this.height = 0]);

  Rectangle.copy(Rectangle other)
      : width = other.width,
        height = other.height;

  void inputData() {
    print("Введення даних прямокутника");
    
    stdout.write("Введіть ширину: ");
    String? wInput = stdin.readLineSync();
    double w = double.tryParse(wInput ?? "") ?? 0;
    if (w < 0) w = 0; 

    stdout.write("Введіть висоту: ");
    String? hInput = stdin.readLineSync();
    double h = double.tryParse(hInput ?? "") ?? 0;
    if (h < 0) h = 0;

    this.width = w;
    this.height = h;
  }

  void printData() {
    print("Прямокутник: ${width.toStringAsFixed(1)} x ${height.toStringAsFixed(1)}");
  }

  double get area => width * height;

  double get perimeter => 2 * (width + height);

  bool isEqual(Rectangle other) {
    return this.width == other.width && this.height == other.height;
  }
  
  void compareWith(Rectangle other) {
    if (this.area > other.area) {
       print("Поточний прямокутник більший за площею.");
    } else if (this.area < other.area) {
       print("Інший прямокутник більший за площею.");
    } else {
       print("Площі прямокутників рівні.");
    }
  }

  Rectangle operator +(Rectangle other) {
    return Rectangle(this.width + other.width, this.height + other.height);
  }

  Rectangle operator -(Rectangle other) {
    double newW = this.width - other.width;
    double newH = this.height - other.height;
    
    return Rectangle(newW < 0 ? 0 : newW, newH < 0 ? 0 : newH);
  }

  Rectangle operator *(double scalar) {
    return Rectangle(this.width * scalar, this.height * scalar);
  }
}

void main() {
  Rectangle rect1 = Rectangle();
  rect1.inputData();
  
  stdout.write("Результат:\n");
  rect1.printData();
  
  print("Площа: ${rect1.area}");
  print("Периметр: ${rect1.perimeter}");

  Rectangle rect2 = Rectangle(2.0, 4.0);
  stdout.write("Прямокутник 2: ");
  rect2.printData();

  Rectangle rect3 = Rectangle.copy(rect1);
  stdout.write("Прямокутник 3: ");
  rect3.printData();

  print("Додавання:");
  Rectangle sum = rect1 + rect2;
  sum.printData();

  print("Віднімання:");
  Rectangle diff = rect1 - rect2;
  diff.printData();

  print("Множення на число:");
  Rectangle mult = rect1 * 2;
  mult.printData();

  print("Чи рівні? ${rect1.isEqual(rect3) ? "Так" : "Ні"}");
  rect1.compareWith(rect2);
}