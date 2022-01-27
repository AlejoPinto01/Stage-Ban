import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stage_ban_sbs/src/stage_card.dart';

class MyHomePage extends StatefulWidget {
  List<String> _stagesNames = [
    'assets/battlefield.jpg',
    'assets/final_destination.jpg',
    'assets/small_battlefield.jpg',
    'assets/pokemon_stadium_2.jpg',
    'assets/hollow_bastion.webp',
    'assets/town_and_city.jpg',
    'assets/smashville.jpg',
    'assets/kalos.jpg',
  ];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _counterPick = false;
  int _bannedCount = 0;
  @override
  Widget build(BuildContext context) {
    List<StageCard> _cards = List<StageCard>.generate(
      widget._stagesNames.length,
      (int index) => StageCard(widget._stagesNames[index]),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('SBS Ruleset'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _cards[0],
                  _cards[1],
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _cards[2],
                  _cards[3],
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _cards[4],
                ],
              ),
              SwitchListTile(
                onChanged: (value) {
                  setState(() {
                    _counterPick = !_counterPick;
                  });
                },
                value: _counterPick,
                title: Text(
                  'View counterpick',
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 200),
            opacity: _counterPick ? 1 : 0,
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _cards[5],
                        _cards[6],
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _cards[7],
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            for (var card in _cards) {
              card.banned = false;
            }
          });
        },
        child: Icon(Icons.restore),
      ),
    );
  }
}
