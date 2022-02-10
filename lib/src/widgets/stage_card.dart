import 'package:flutter/material.dart';
import 'package:stage_ban_sbs/src/data/data.dart';
import 'package:stage_ban_sbs/src/models/stage.dart';
import 'package:stage_ban_sbs/src/pages/stage_page.dart';

class StageCard extends StatefulWidget {
  bool banned = false;
  Stage _stage;
  double _width = 185;
  double _height = 115;

  StageCard(this._stage, BuildContext context) {
    if (MediaQuery.of(context).size.width < 500) {
      _width = MediaQuery.of(context).size.width / 2 - 20;
    } else {
      _width = MediaQuery.of(context).size.width / 4 - 20;
    }
    if (MediaQuery.of(context).size.height < 500) {
      _height = MediaQuery.of(context).size.height / 2 - 60;
    } else {
      _height = MediaQuery.of(context).size.height / 4 - 50;
    }
    // _width = MediaQuery.of(context).size.width / 2 - 20;
    // _height = MediaQuery.of(context).size.height / 4.5 - 60;
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    print('Width = $_width - Height = $_height');
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
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Hero(
                    tag: widget._stage.stageName,
                    child: Image.asset(
                      widget._stage.imagePath,
                      fit: BoxFit.cover,
                      width: widget._width,
                      height: widget._height,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      widget._stage.stageName,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
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
