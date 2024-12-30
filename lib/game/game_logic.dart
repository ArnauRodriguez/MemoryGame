import 'dart:async';

import 'dart:collection';

import 'package:flutter/material.dart';

class GameLogic {
  String hiddenCard = '';
  List<String>? cardsImg;
  String level = '';

  late List<String> card_list = [];

  var axiCount = 0;
  var cardCount = 0;
  List<Map<int, String>> matchCheck = [];

  void initGame(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    String theme = arguments['theme'] as String;
    String difficult = arguments['level'] as String;
    if (difficult == 'medium') {
      cardCount = 24;
      axiCount = 6;
      if(theme == 'videojuegos'){
        hiddenCard = 'assets/images/box.png';
        card_list = [
          'assets/images/angry-birds.png',
          'assets/images/bomberman.png',
          'assets/images/angry-birds.png',
          'assets/images/carnivorous-plant.png',
          'assets/images/game-console.png',
          'assets/images/snake.png',
          'assets/images/snake.png',
          'assets/images/gamepad.png',
          'assets/images/carnivorous-plant.png',
          'assets/images/box.png',
          'assets/images/game-pad.png',
          'assets/images/tetris.png',
          'assets/images/carnivorous-plant.png',
          'assets/images/carnivorous-plant.png',
          'assets/images/tetris.png',
          'assets/images/minecraft.png',
          'assets/images/minecraft.png',
          'assets/images/pikachu.png',
          'assets/images/pikachu.png',
          'assets/images/bomberman.png',
          'assets/images/pick.png',
          'assets/images/pick.png',
          'assets/images/box.png',
          'assets/images/game-console.png',
        ];
      } else if (theme == 'superheroes') {
        hiddenCard = 'assets/images/box2.webp';
        card_list = [
          'assets/images/spiderman.png',
          'assets/images/spiderman.png',
          'assets/images/capmarvel.png',
          'assets/images/capmarvel.png',
          'assets/images/ironman.png',
          'assets/images/ironman.png',
          'assets/images/hulk.png',
          'assets/images/hulk.png',
          'assets/images/viuda.png',
          'assets/images/viuda.png',
          'assets/images/thor.png',
          'assets/images/thor.png',
          'assets/images/strange.png',
          'assets/images/strange.png',
          'assets/images/batman.png',
          'assets/images/batman.png',
          'assets/images/superman.png',
          'assets/images/superman.png',
          'assets/images/deadpool.png',
          'assets/images/deadpool.png',
          'assets/images/colossus.png',
          'assets/images/colossus.png',
          'assets/images/capamerica.png',
          'assets/images/capamerica.png'
        ];
      } else {
        hiddenCard = 'assets/images/box3.png';
        card_list = [
          'assets/images/leon.webp',
          'assets/images/leon.webp',
          'assets/images/tigre.webp',
          'assets/images/tigre.webp',
          'assets/images/mapache.webp',
          'assets/images/mapache.webp',
          'assets/images/serpiente.png',
          'assets/images/serpiente.png',
          'assets/images/araña.webp',
          'assets/images/araña.webp',
          'assets/images/lagarto.webp',
          'assets/images/lagarto.webp',
          'assets/images/loro.webp',
          'assets/images/loro.webp',
          'assets/images/jirafa.png',
          'assets/images/jirafa.png',
          'assets/images/elefante.webp',
          'assets/images/elefante.webp',
          'assets/images/jaguar.webp',
          'assets/images/jaguar.webp',
          'assets/images/tortuga.webp',
          'assets/images/tortuga.webp',
          'assets/images/tiburon.webp',
          'assets/images/tiburon.webp'
        ];
      }

    } else if (difficult == 'hard') {
      cardCount = 30;
      axiCount = 6;
      if(theme == 'videojuegos'){
        hiddenCard = 'assets/images/box.png';
        card_list = [
          'assets/images/angry-birds.png',
          'assets/images/bomberman.png',
          'assets/images/angry-birds.png',
          'assets/images/carnivorous-plant.png',
          'assets/images/game-console.png',
          'assets/images/gamepad.png',
          'assets/images/carnivorous-plant.png',
          'assets/images/game-console.png',
          'assets/images/angry-birds.png',
          'assets/images/angry-birds.png',
          'assets/images/game-pad.png',
          'assets/images/game-pad.png',
          'assets/images/carnivorous-plant.png',
          'assets/images/carnivorous-plant.png',
          'assets/images/gamepad.png',
          'assets/images/minecraft.png',
          'assets/images/minecraft.png',
          'assets/images/pick.png',
          'assets/images/pick.png',
          'assets/images/bomberman.png',
          'assets/images/pick.png',
          'assets/images/pick.png',
          'assets/images/game-console.png',
          'assets/images/game-console.png',
          'assets/images/game-console.png',
          'assets/images/game-console.png',
          'assets/images/bomberman.png',
          'assets/images/bomberman.png',
          'assets/images/minecraft.png',
          'assets/images/minecraft.png'
        ];
      } else if (theme == 'superheroes') {
        hiddenCard = 'assets/images/box2.webp';
        card_list = [
          'assets/images/spiderman.png',
          'assets/images/spiderman.png',
          'assets/images/capmarvel.png',
          'assets/images/capmarvel.png',
          'assets/images/ironman.png',
          'assets/images/ironman.png',
          'assets/images/hulk.png',
          'assets/images/hulk.png',
          'assets/images/viuda.png',
          'assets/images/viuda.png',
          'assets/images/thor.png',
          'assets/images/thor.png',
          'assets/images/strange.png',
          'assets/images/strange.png',
          'assets/images/batman.png',
          'assets/images/batman.png',
          'assets/images/superman.png',
          'assets/images/superman.png',
          'assets/images/deadpool.png',
          'assets/images/deadpool.png',
          'assets/images/colossus.png',
          'assets/images/colossus.png',
          'assets/images/capamerica.png',
          'assets/images/capamerica.png',
          'assets/images/groot.png',
          'assets/images/groot.png',
          'assets/images/venom.png',
          'assets/images/venom.png',
          'assets/images/wolverine.webp',
          'assets/images/wolverine.webp'
        ];
      } else {
        hiddenCard = 'assets/images/box3.png';
        card_list = [
          'assets/images/leon.webp',
          'assets/images/leon.webp',
          'assets/images/tigre.webp',
          'assets/images/tigre.webp',
          'assets/images/mapache.webp',
          'assets/images/mapache.webp',
          'assets/images/serpiente.png',
          'assets/images/serpiente.png',
          'assets/images/araña.webp',
          'assets/images/araña.webp',
          'assets/images/lagarto.webp',
          'assets/images/lagarto.webp',
          'assets/images/loro.webp',
          'assets/images/loro.webp',
          'assets/images/jirafa.png',
          'assets/images/jirafa.png',
          'assets/images/elefante.webp',
          'assets/images/elefante.webp',
          'assets/images/jaguar.webp',
          'assets/images/jaguar.webp',
          'assets/images/tortuga.webp',
          'assets/images/tortuga.webp',
          'assets/images/tiburon.webp',
          'assets/images/tiburon.webp',
          'assets/images/mono.webp',
          'assets/images/mono.webp',
          'assets/images/hiena.png',
          'assets/images/hiena.png',
          'assets/images/rhino.webp',
          'assets/images/rhino.webp',
        ];
      }

    } else {
      cardCount = 16;
      axiCount = 4;
      if(theme == 'videojuegos'){
        hiddenCard = 'assets/images/box.png';
        card_list = [
          'assets/images/angry-birds.png',
          'assets/images/bomberman.png',
          'assets/images/angry-birds.png',
          'assets/images/carnivorous-plant.png',
          'assets/images/game-console.png',
          'assets/images/gamepad.png',
          'assets/images/carnivorous-plant.png',
          'assets/images/game-console.png',
          'assets/images/game-pad.png',
          'assets/images/game-pad.png',
          'assets/images/gamepad.png',
          'assets/images/minecraft.png',
          'assets/images/minecraft.png',
          'assets/images/pick.png',
          'assets/images/pick.png',
          'assets/images/bomberman.png',
        ];
      } else if (theme == 'superheroes') {
        hiddenCard = 'assets/images/box2.webp';
        card_list = [
          'assets/images/spiderman.png',
          'assets/images/spiderman.png',
          'assets/images/capmarvel.png',
          'assets/images/capmarvel.png',
          'assets/images/ironman.png',
          'assets/images/ironman.png',
          'assets/images/hulk.png',
          'assets/images/hulk.png',
          'assets/images/viuda.png',
          'assets/images/viuda.png',
          'assets/images/thor.png',
          'assets/images/thor.png',
          'assets/images/strange.png',
          'assets/images/strange.png',
          'assets/images/batman.png',
          'assets/images/batman.png'
        ];
      } else {
        hiddenCard = 'assets/images/box3.png';
        card_list = [
          'assets/images/leon.webp',
          'assets/images/leon.webp',
          'assets/images/tigre.webp',
          'assets/images/tigre.webp',
          'assets/images/mapache.webp',
          'assets/images/mapache.webp',
          'assets/images/serpiente.png',
          'assets/images/serpiente.png',
          'assets/images/araña.webp',
          'assets/images/araña.webp',
          'assets/images/lagarto.webp',
          'assets/images/lagarto.webp',
          'assets/images/loro.webp',
          'assets/images/loro.webp',
          'assets/images/jirafa.png',
          'assets/images/jirafa.png'
        ];
      }

    }
    card_list.shuffle();
    cardsImg = List<String>.generate(cardCount, (index) {
      return hiddenCard;
    });
  }
}
