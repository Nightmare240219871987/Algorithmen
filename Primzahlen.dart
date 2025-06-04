import 'dart:math';
import 'dart:io';


void main() {
  int input = getUserInput();
  Map<int, bool> primeList = generatePrimeList(input);
  generatePrimes(primeList, input);
  showPrimes(primeList);
 
}

int getUserInput() {
  // Benutzereingabe der Obergrenze für Primzahlen.
  stdout.write("Bitte gib eine Zahl als grenze ein : ");
  int input = int.parse(stdin.readLineSync()!);
  return input;
}

Map<int, bool> generatePrimeList(int input) {
  /******************************************************
  ## Hier findet eine Optimierung (Speicher)
  ## Hier wird die effektive Listegröße errechnet 
  ## um die Geraden Zahlen nicht mit speichern zu müssen 
  *******************************************************/
  int listSize = (input - 3) ~/ 2 + 1;

  //Liste wird erstellt und befüllt.
  Map<int, bool> primeList = {};
  primeList[2] = true;
  for(int i = 0; i < listSize; i++){
    primeList[(i * 2) + 3] = true;
  }
  return primeList;
}

void generatePrimes(Map<int,bool> primeList, int input){
  /**************************************************************
  ## Hier wird eine weitere Optimierung angewendet (Last), damit 
  ## unnötige Schleifendurchläufe abgestellt werden. Wird 
  ## hier von der eingabe also (Begrenung) eine Wurzel gezogen,
  ## da zB. wenn man 100 hat nur 10 durchläufe stattfinden muss, 
  ## um alle Zahl bis 100 gestrichen zu haben. 
  ***************************************************************/
  int sqrtInput = sqrt(input).toInt();
  
  // Siebvorgang
  for (int i = 0; i < primeList.length; i++) {
    // Echte Zahl wird zusammengebaut
    int p = i * 2 + 3;

    // Abbruchbedingung "Quadrat"
    if (p > sqrtInput) {
      break;
    }

    // Wenn aktuelle Zahl eine Primzahl ist.
    if (primeList[p] == true) {
      // Start-, und Zahl errechnen
      int start = p * p;
      int startIndex = (start - 3) ~/ 2;

      /********************************************************
      ## Hier wird der Eigendlich Siebvorgang durchgeführt. Man
      ## fängt mit dem startIndex an und hört mit der Listen auf.
      ## nach jedem Schleifendurchlauf wird Schleifenindex um die
      ## Aktuelle Zahl Addiert. Und in der Schleife wird in boolList
      ## an der Stelle des Schleifenindex auf False. Weil es keine 
      ## Primzahl sein kann.
      *********************************************************/
      for (int j = startIndex; j < primeList.length; j += p) {
        primeList[(j * 2) + 3] = false;
      }
    }
  }
}

void showPrimes(Map<int, bool> primeList) {
  int count = 0;
   primeList.forEach((key, value){
    if(value == true){
      count++;
      print("$count. =>  $key");
    };
  });
}

void showNoPrimes(Map<int, bool> primeList, int input) {
  List<int> noPrimes = [];
  for(int i = 0; i < input; i++) {
    noPrimes.add(i+1);
  }
  
  for(int i = 0; i < primeList.keys.toList().length; i++) {
    if(primeList.values.toList()[i] == true){
      noPrimes.remove(primeList.keys.toList()[i]);
    }    
  }
  print(noPrimes);
}
