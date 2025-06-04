import 'dart:io';


// fib=fn-1 + fn-2
void main() {
  List<BigInt> fibNumbers = [];
  stdout.write("Geben sie die anzahl der Fibonacci-Zahlen an : ");
  int? input = int.tryParse(stdin.readLineSync()!);
  BigInt n1 = BigInt.from(1);
  BigInt n2 = BigInt.from(1);
  BigInt fib = BigInt.from(0);

  if(input == null || input < 1) {
    print("gib eine gültige und positive Zahl ein : ");
    return;
  }

  if(input == 1){
    print([1]);
    return;
  }

  fibNumbers.addAll([BigInt.from(1),BigInt.from(1)]);
  for(int i = 0; i < (input-2); i++){
    fib = n1 + n2;
    fibNumbers.add(fib);
    n1 = n2; 
    n2 = fib;       
  }

  print(fibNumbers);
}