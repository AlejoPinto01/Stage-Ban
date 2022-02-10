import 'package:flutter/material.dart';
import 'package:stage_ban_sbs/src/data/data.dart';
import 'package:stage_ban_sbs/src/widgets/stage_card.dart';

class SelectableGrid extends StatefulWidget {
  SelectableGrid({Key? key}) : super(key: key);

  @override
  State<SelectableGrid> createState() => _SelectableGridState();
}

class _SelectableGridState extends State<SelectableGrid> {
  int optionSelected = 0;

  @override
  Widget build(BuildContext context) {
    List<StageCard> _cards = List<StageCard>.generate(
      getStagesNames().length,
      (int index) => StageCard(getStages()[index], context),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Selection and Settings $optionSelected'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: _cards,
      ),
    );
  }
}
