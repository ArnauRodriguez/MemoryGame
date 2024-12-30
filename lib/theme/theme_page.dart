import 'package:flutter/material.dart';
import 'package:memory_game/shared/utils.dart' as utils;


class ThemePage extends StatelessWidget {
  ThemePage({Key? key}) : super(key: key);

  String level = '';

  @override
  Widget build(BuildContext context) {
  Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
  String difficult = arguments['level'] as String;
  if(difficult == 'hard'){
    level = 'hard';
  } else if (difficult == 'medium'){
    level = 'medium';
  } else {
    level = 'easy';
  }

    return Scaffold(
        backgroundColor: utils.blueColor,
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
            )
          ],
          // title: const Text('Memory Game'),
          backgroundColor: utils.blueColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Center(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                const SizedBox(
                  height: 30,
                ),
                const Image(image: AssetImage('assets/images/Memories.png')),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'game',
                        arguments: {'level': level, 'theme': 'videojuegos'});
                  },
                  child: const Text('Videojuegos',
                      style: TextStyle(
                          color: utils.whiteColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'game',
                          arguments: {'level': level, 'theme': 'superheroes'});
                    },
                    child: const Text(
                      'Superheroes',
                      style: TextStyle(
                          color: utils.whiteColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    )),
                const SizedBox(height: 20),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'game',
                          arguments: {'level': level, 'theme': 'animales'});
                    },
                    child: const Text('Animales',
                        style: TextStyle(
                            color: utils.whiteColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold))),
                const SizedBox(height: 20),
              ]),
            ),
          ),
        ));
  }
}
