import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stage_ban_sbs/src/stage_card.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _counterPick = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SBS Ruleset'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text('Starter'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StageCard(),
                  StageCard(),
                  StageCard(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StageCard(),
                  StageCard(),
                ],
              ),
            ],
          ),
          Visibility(
            visible: _counterPick,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text('Counterpick'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StageCard(),
                    StageCard(),
                    StageCard(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        child: SwitchListTile(
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
      ),
    );
  }
}
