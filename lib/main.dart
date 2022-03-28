import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Zadanie 4',
      home: MyCustomForm(),
    );
  }
}


class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}


class _MyCustomFormState extends State<MyCustomForm> {

  final numberRange = TextEditingController();
  final inputedNumber = TextEditingController();

  var randomNumber;
  var guessedNumber;
  var turnNumber = 0;

  numberLottery(){
    turnNumber = 0;
    int randomNumberInt = int.parse(numberRange.text);
    randomNumber =  Random().nextInt(randomNumberInt);
    print(randomNumber);
  }

  guessNumber(){

    int guessedNumberInt = int.parse(inputedNumber.text);
    guessedNumber =  guessedNumberInt;

    if(guessedNumber == randomNumber){
      turnNumber++;
      print("trafiles za ");
      print(turnNumber);
      if(turnNumber <= 2){
        print("WYGRALES ");
      }
    }
    if(guessedNumber < randomNumber){
      turnNumber++;
      print("Wartość zbyt mała");
    }
    if(guessedNumber > randomNumber){
      turnNumber++;
      print("Wartość zbyt duża");
    }
  }

  @override
  void dispose() {
    numberRange.dispose();
    inputedNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zadanie 4 - Zgadywanka'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 35),
        child: Column(
          children: [

            const Text('Podaj zakres losowania danych:'),

            TextField( controller: numberRange, decoration: InputDecoration(border: OutlineInputBorder()), ),

            ElevatedButton(
              onPressed: () {
                // Respond to button press
                numberLottery();
              },
              child: Text('Losowanie'),
            ),

            const Text('Proponowana wartość:'),

            TextField( controller: inputedNumber, decoration: InputDecoration(border: OutlineInputBorder()),),

            ElevatedButton(
              onPressed: () {
                // Respond to button press
                guessNumber();
              },
              child: Text('Sprwadź'),
            ),

             Text('Uzyskana wartość za: ${turnNumber}')
          ],
        ),
      ),
    );
  }
}