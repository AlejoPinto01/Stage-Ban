import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stage_ban_sbs/src/stage_card.dart';

import 'package:stage_ban_sbs/src/data.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _counterPick = false;
  int _bannedCount = 0;
  @override
  Widget build(BuildContext context) {
    List<StageCard> _cards = List<StageCard>.generate(
      getStagesNames().length,
      (int index) => StageCard(getStagesNames()[index]),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('SBS Ruleset'),
      ),
      //LayoutBuilder(
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
            ],
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 200),
            opacity: _counterPick ? 1 : 0,
            child: Column(
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
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Show counter'),
          Switch(
            onChanged: (value) {
              setState(() {
                _counterPick = !_counterPick;
                setCounter(0);
              });
            },
            value: _counterPick,
          ),
          SizedBox(
            width: 50,
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                for (StageCard card in _cards) {
                  card.setBanned(false);
                  setCounter(0);
                }
              });
            },
            child: Icon(Icons.restore),
          ),
        ],
      ),
    );
  }
}
