import 'package:flutter/material.dart';
import 'package:stage_ban_sbs/src/data.dart';
import 'package:stage_ban_sbs/src/pages/stage_page.dart';

class StageCard extends StatefulWidget {
  bool banned = false;
  String _stageName;
  double _width = 260;
  double _height = 130;

  StageCard(this._stageName, BuildContext context) {
    _width = MediaQuery.of(context).size.width / 2 - 20;
    _height = MediaQuery.of(context).size.height / 4.5 - 60;
  }

  bool isBanned() {
    return banned;
  }

  void setBanned(bool banned) {
    this.banned = banned;
  }

  double getWidth() {
    return _width;
  }

  void setWidth(double width) {
    _width = width;
  }

  double getHeight() {
    return _height;
  }

  void setHeight(double height) {
    _height = height;
  }

  @override
  State<StageCard> createState() => _StageCardState();
}

class _StageCardState extends State<StageCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.banned = !widget.banned;
            setCounter(widget.banned ? getCounter() + 1 : getCounter() - 1);
            print(getCounter());
            // if (getCounter() > 3) {
            //   setCounter(0);
            //   final route = MaterialPageRoute(
            //     builder: (context) {
            //       return StagePage(widget._stageName);
            //     },
            //   );
            //   Navigator.push(context, route);
            // }
          });
        },
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                blurRadius: 10,
                //color: Colors.black45,
                color: Colors.transparent,
              ),
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          width: widget._width,
          height: widget._height,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Hero(
                  tag: widget._stageName,
                  child: Image.asset(
                    widget._stageName,
                    fit: BoxFit.cover,
                    width: widget._width,
                    height: widget._height,
                  ),
                ),
              ),
              Center(
                child: AnimatedScale(
                  scale: widget.banned ? 1 : 0,
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceInOut,
                  child: Icon(
                    Icons.cancel,
                    size: widget._height,
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
