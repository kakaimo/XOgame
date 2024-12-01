import 'package:flutter/material.dart';
import 'package:xogame/button.dart';
import 'package:xogame/namemodel.dart';

class Xoscreen extends StatefulWidget {
  static const String routeName = 'xo';

  const Xoscreen({super.key});

  @override
  State<Xoscreen> createState() => _XoscreenState();
}

class _XoscreenState extends State<Xoscreen> {
  List<String> boardState = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
    NameArgs args = ModalRoute.of(context)!.settings.arguments as NameArgs;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'X.O GAME',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Display Scores
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${args.nameOne} x',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$player1Score',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${args.nameTwo} o',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$player2Score',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Game Board (3x3)
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Button(
                  text: boardState[0],
                  index: 0,
                  onButtonClick: onButtonAction,
                ),
                Button(
                  text: boardState[1],
                  index: 1,
                  onButtonClick: onButtonAction,
                ),
                Button(
                  text: boardState[2],
                  index: 2,
                  onButtonClick: onButtonAction,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Button(
                  text: boardState[3],
                  index: 3,
                  onButtonClick: onButtonAction,
                ),
                Button(
                  text: boardState[4],
                  index: 4,
                  onButtonClick: onButtonAction,
                ),
                Button(
                  text: boardState[5],
                  index: 5,
                  onButtonClick: onButtonAction,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Button(
                  text: boardState[6],
                  index: 6,
                  onButtonClick: onButtonAction,
                ),
                Button(
                  text: boardState[7],
                  index: 7,
                  onButtonClick: onButtonAction,
                ),
                Button(
                  text: boardState[8],
                  index: 8,
                  onButtonClick: onButtonAction,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;

  void onButtonAction(int index) {
    if (boardState[index].isNotEmpty) {
      return; // Ignore if the cell is already occupied
    }
    setState(() {
      if (counter % 2 == 0) {
        boardState[index] = 'x';
      } else {
        boardState[index] = 'o';
      }
      counter++;
    });

    // Check for a winner
    if (checkWinner('x')) {
      setState(() {
        player1Score += 5;
        clearBoard();
      });
    } else if (checkWinner('o')) {
      setState(() {
        player2Score += 5;
        clearBoard();
      });
    } else if (counter == 9) {
      setState(() {
        clearBoard();
      });
    }
  }

  bool checkWinner(String symbol) {
    // Check horizontal lines
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }

    // Check vertical lines
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
    }

    // Check diagonals
    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }
    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    }

    return false;
  }

  void clearBoard() {
    boardState = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
    counter = 0;
  }
}
