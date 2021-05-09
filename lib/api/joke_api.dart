import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideati_ilukas/models/joke.dart';

class JokeAPI {
  JokeAPI._internal();
  static JokeAPI _instance = JokeAPI._internal();
  static JokeAPI get instance => _instance;
  final _dio = Dio();

  Future<Joke> getJoke() async {
    try {
      final responseJoke = await _dio.get(
        'https://icanhazdadjoke.com/',
        options: Options(headers: {'Accept': 'application/json'}),
      );

      return Joke.fromJson(
          responseJoke.data,
          'https://avatars.dicebear.com/api/avataaars/' +
              '${Random().nextInt(100)}' +
              '.svg');
    } catch (e) {
      Get.dialog(AlertDialog(
        title: Text(e.toString()),
        actions: [TextButton(onPressed: Get.back, child: Text('Aceptar'))],
      ));
      return null;
    }
  }
}
