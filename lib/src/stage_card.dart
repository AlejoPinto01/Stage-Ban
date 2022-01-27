import 'package:flutter/material.dart';
import 'package:stage_ban_sbs/src/data.dart';

class StageCard extends StatefulWidget {
  bool banned = false;
  String _stageName;
  StageCard(this._stageName);

  bool isBanned() {
    return banned;
  }

  void setBanned(bool banned) {
    this.banned = banned;
  }

  @override
  State<StageCard> createState() => _StageCardState();
}

class _StageCardState extends State<StageCard> {
  double _width = 170;
  double _height = 90;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.banned = !widget.banned;
            setCounter(widget.banned ? getCounter() + 1 : getCounter() - 1);
            print(getCounter());
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
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceInOut,
                  child: Icon(
                    Icons.cancel,
                    size: _height,
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
