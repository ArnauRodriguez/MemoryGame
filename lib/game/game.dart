import 'dart:async';
import 'dart:developer';
import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/game/game_logic.dart';
import 'package:memory_game/game/widgets/board.dart';
import 'package:memory_game/shared/utils.dart' as utils;
import 'package:memory_game/game/widgets/dialoag.dart';
import '../game/widgets/record.dart';


class Game extends StatefulWidget {
  Game({Key? key}) : super(key: key);
  @override
  State<Game> createState() => _GameState();

}

class _GameState extends State<Game> {

  late ConfettiController _controller;

  Record record = Record.getInstance();

  final GameLogic _game = GameLogic();

  var levelForCardCount = 0;
  var tries = 0;
  var score = 0;
  var axisNumber = 4;
  late Timer timer;
  int startTime = 60;
  String level = '';
  var complete = 0;

  bool nouRecord = false;

  void startTimer(BuildContext context) {
    if (startTime == 0) {}
    const oneSecond = Duration(seconds: 1);
    timer = Timer.periodic(oneSecond, (timer) {
      if(startTime == 0 && score > record.getRecord){
        timer.cancel();
        generarConfetti();
        _showDialog(context, 'Game Over', 'Nuevo record!!! Tu puntuación fue de: $score');
        record.setRecord = score;
      } else if (startTime == 0) {
        timer.cancel();
        _showDialog(context, 'Game Over', 'Tu puntuación fue de: $score');
      } else {
        setState(() {
          startTime--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: Duration(seconds: 2));
    startTimer(context);
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _game.initGame(context);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    var displayRecord = record.getRecord;

    return WillPopScope(
      onWillPop: () async {
        bool willLeave = false;
        timer.cancel();
        // show the confirm dialog
        await showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: const Text('Seguro que quiere salir de la partida?'),
                  actions: [
                    ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(backgroundColor: utils.redColor),
                        onPressed: () {
                          willLeave = true;
                          Navigator.of(context).pop();
                        },
                        child: const Text('Yes')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          startTimer(context);
                        },
                        child: const Text(
                          'No',
                          style: TextStyle(color: utils.blueColor),
                        ))
                  ],
                ));
        return willLeave;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: utils.redColor,
        ),
        backgroundColor: utils.redColor,
        body: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              board('Time', '$startTime'),
              board('Score', '$score'),
              board('Moves', '$tries'),
              board('Current record', '$displayRecord')
            ],
          ),
        SingleChildScrollView(
         child: SizedBox(
            height: 804,
            width: screenWidth,
            child: GridView.builder(
                itemCount: _game.cardsImg!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _game.axiCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          tries++;

                          _game.cardsImg![index] = _game.card_list[index];

                          _game.matchCheck.add({index: _game.card_list[index]});

                          if (_game.matchCheck.length == 2) {
                            if (_game.matchCheck[0].values.first ==
                                _game.matchCheck[1].values.first) {
                              score += 100;
                              complete += 1;
                              final player = AudioPlayer();
                              player.play(DeviceFileSource('assets/sounds/win.wav'));
                              _game.matchCheck.clear();
                              if(complete * 2 == _game.cardCount && score > record.getRecord){
                                  generarConfetti();
                                _showDialog(context, 'Ganaste',
                                    'Nuevo Record!!! Tu puntuación fue de: $score');
                                  final player = AudioPlayer();
                                  player.play(DeviceFileSource('assets/sounds/record.wav'));
                                record.setRecord = score;
                                timer.cancel();
                              } else if (complete * 2 == _game.cardCount) {
                                _showDialog(context, 'Ganaste',
                                    'Tu puntuación fue de: $score');
                                timer.cancel();
                              }
                            } else {
                              Future.delayed(const Duration(milliseconds: 500),
                                  () {
                                setState(() {
                                  _game.cardsImg![_game.matchCheck[0].keys
                                      .first] = _game.hiddenCard;
                                  _game.cardsImg![_game.matchCheck[1].keys
                                      .first] = _game.hiddenCard;

                                  _game.matchCheck.clear();
                                });
                              });
                            }
                          }
                        });

                        // _game.matchCheck
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: utils.whiteColor,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(_game.cardsImg![index]),
                                fit: BoxFit.cover)),
                      ));

                }),
          )),
        Center(
            child: ConfettiWidget(
              confettiController: _controller,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              numberOfParticles: 80,
              minBlastForce: 70,
              maxBlastForce: 100,
            ))
            ]),
      ),
    );
  }

  void _showDialog(BuildContext context, String title, String info) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(info),
            actions: <Widget>[
              TextButton(
                child: const Text('Ir a inicio'),
                onPressed: () {
                  // Navigator.of(context).pop();
                  Navigator.pushNamed(context, 'home');
                },
              )
            ],
          );
        });
  }

  void generarConfetti(){
    _controller.play();
  }

}
