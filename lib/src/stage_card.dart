import 'package:flutter/material.dart';

class StageCard extends StatefulWidget {
  bool banned = false;
  String _stageName;
  StageCard(this._stageName);

  @override
  State<StageCard> createState() => _StageCardState();
}

class _StageCardState extends State<StageCard> {
  double _width = 170;
  double _height = 110;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.banned = !widget.banned;
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
            borderRadius: BorderRadius.circular(12),
          ),
          width: _width,
          height: _height,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget._stageName,
                  fit: BoxFit.cover,
                  width: _width,
                  height: _height,
                ),
              ),
              Center(
                child: AnimatedScale(
                  scale: widget.banned ? 1 : 0,
                  duration: Duration(milliseconds: 50),
                  curve: Curves.bounceIn,
                  child: Icon(
                    Icons.cancel,
                    size: 100,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
