import 'package:flutter/material.dart';
import 'package:xogame/namemodel.dart';
import 'package:xogame/xoscreen.dart';

class PlayerName extends StatelessWidget {
  static const String routeName = 'player';

  String player1Name = '';
  String player2Name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'player Screen',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Player one',
                labelStyle: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18,
                ),
                hintText: 'Type something...',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              ),
              onChanged: (text) {
                player1Name = text;
              },
            ),
            const SizedBox(
              height: 22,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Player Two',
                labelStyle: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18,
                ),
                hintText: 'Type something...',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              ),
              onChanged: (text) {
                player2Name = text;
              },
            ),
            const SizedBox(
              height: 22,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Xoscreen.routeName,
                    arguments:
                        NameArgs(nameOne: player1Name, nameTwo: player2Name));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                elevation: 5,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              ),
              child: const Text(
                'Let\'s Play',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
