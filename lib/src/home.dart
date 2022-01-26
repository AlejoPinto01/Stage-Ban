import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SBS Ruleset'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text('Starter'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _stageCard(),
                    _stageCard(),
                    _stageCard(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _stageCard(),
                    _stageCard(),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Counterpick'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _stageCard(),
                _stageCard(),
                _stageCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _stageCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                blurRadius: 10,
                color: Colors.black45,
              ),
            ],
            color: const Color(0xff7c94b6),
            image: const DecorationImage(
              image: AssetImage('assets/battlefield.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          width: 100,
          height: 100,
          child: Icon(
            Icons.cancel,
            size: 100,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
