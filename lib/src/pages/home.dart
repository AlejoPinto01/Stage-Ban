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
      (int index) => StageCard(getStagesNames()[index], context),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('SBS Ruleset'),
        shadowColor: Colors.transparent,
      ),
      //backgroundColor: Colors.pink,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 10,
            child: Center(
              child: Text(
                'Ban 3 stages then pick',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: _counterPick
                ? _cards
                : [
                    _cards[0],
                    _cards[1],
                    _cards[2],
                    _cards[3],
                    _cards[4],
                  ],
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Show counterpick'),
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
            width: 20,
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
