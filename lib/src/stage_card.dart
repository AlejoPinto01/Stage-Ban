import 'package:flutter/material.dart';

class StageCard extends StatefulWidget {
  @override
  State<StageCard> createState() => _StageCardState();
}

class _StageCardState extends State<StageCard> {
  bool banned = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            banned = !banned;
          });
        },
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
          child: AnimatedScale(
            scale: banned ? 1 : 0,
            duration: Duration(milliseconds: 50),
            curve: Curves.bounceIn,
            child: Icon(
              Icons.cancel,
              size: 100,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
