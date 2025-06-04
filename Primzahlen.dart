import 'dart:math';
import 'dart:io';


void main() {
  // Benutzereingabe der Obergrenze für Primzahlen.
  stdout.write("Bitte gib eine Zahl als grenze ein : ");
  int input = int.parse(stdin.readLineSync()!);

  /******************************************************
  ## Hier findet eine Optimierung (Speicher)
  ## Hier wird die effektive Listegröße errechnet 
  ## um die Geraden Zahlen nicht mit speichern zu müssen 
  *******************************************************/
  int listSize = ((input - 3) ~/ 2) + 1;

  /**************************************************************
  ## Hier wird eine weitere Optimierung angewendet (Last), damit 
  ## unnötige Schleifendurchläufe abgestellt werden. Wird 
  ## hier von der eingabe also (Begrenung) eine Wurzel gezogen,
  ## da zB. wenn man 100 hat nur 10 durchläufe stattfinden muss, 
  ## um alle Zahl bis 100 gestrichen zu haben. 
  ***************************************************************/
  int sqrtInput = sqrt(input).toInt();

  //Listen werden erstellt und vor befüllt
  List<bool> boolList = List.filled(listSize, true);
  List<int> primesList = [2];
  
  // Siebvorgang
  for (int i = 0; i < boolList.length; i++) {
    // Echte Zahl wird zusammengebaut
    int p = i * 2 + 3;

    // Abbruchbedingung "Quadrat"
    if (p > sqrtInput) {
      break;
    }

    // Wenn aktuelle Zahl eine Primzahl ist.
    if (boolList[i]) {
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
      for (int j = startIndex; j < boolList.length; j += p) {
        boolList[j] = false;
      }
    }
  }

  // Zusammenstellung und Ausgabe der primesList.
  for (int i = 0; i < boolList.length; i++) {
    if (boolList[i]) {
      primesList.add(i * 2 + 3);
    }
  }

  print(primesList);
}
