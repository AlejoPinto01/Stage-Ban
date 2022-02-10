import 'package:stage_ban_sbs/src/models/stage.dart';

List<String> stagesPaths = [
  'assets/battlefield.jpg',
  'assets/small_battlefield.jpg',
  'assets/final_destination.jpg',
  'assets/pokemon_stadium_2.jpg',
  //'assets/hollow_bastion.webp',
  'assets/smashville.jpg',
  'assets/town_and_city.jpg',
  //'assets/kalos.jpg',
  'assets/lylat.jpg'
];

List<Stage> stages = [
  Stage(stageName: 'Battlefiled', imagePath: stagesPaths[0]),
  Stage(stageName: 'Small Battlefiled', imagePath: stagesPaths[1]),
  Stage(stageName: 'Final Destination', imagePath: stagesPaths[2]),
  Stage(stageName: 'Pokemon Stadium 2', imagePath: stagesPaths[3]),
  Stage(stageName: 'Smashville', imagePath: stagesPaths[4]),
  Stage(stageName: 'Town and City', imagePath: stagesPaths[5]),
  Stage(stageName: 'Lylat Cruise', imagePath: stagesPaths[6]),
];

List<String> getStagesNames() {
  return stagesPaths;
}

List<Stage> getStages() {
  return stages;
}

int counter = 0;

int getCounter() {
  return counter;
}

void setCounter(int setCount) {
  counter = setCount;
}
