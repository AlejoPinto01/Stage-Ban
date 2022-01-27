import 'package:flutter/material.dart';

class StagePage extends StatelessWidget {
  String _imagePath;

  StagePage(this._imagePath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_imagePath),),
      body: Container(
        child: Hero(
          tag: _imagePath,
          child: Image.asset(
            _imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
