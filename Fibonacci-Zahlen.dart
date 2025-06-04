import 'dart:io';


// fib=fn-1 + fn-2
void main() {
  List<int> fibNumbers = [];
  int? input = int.tryParse(stdin.readLineSync()!);
  int n1 = 1;
  int n2 = 1;
  int fib = 0;

  if(input == null || input < 1) {
    print("gib eine gültige und positive Zahl ein : ");
    return;
  }

  if(input == 1){
    print([1]);
    return;
  }

  fibNumbers.addAll([1,1]);
  for(int i = 0; i < (input-2); i++){
    fib = n1 + n2;
    fibNumbers.add(fib);
    n1 = n2; 
    n2 = fib;       
  }

  print(fibNumbers);
}