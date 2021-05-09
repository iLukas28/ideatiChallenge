import 'package:flutter/material.dart';

class Joke {
  final String id, joke, avatar;
  int likes;

  Joke(
      {@required this.likes,
      @required this.id,
      @required this.joke,
      @required this.avatar});

  static Joke fromJson(Map<String, dynamic> json, String url) {
    return Joke(likes: 0, id: json['id'], joke: json['joke'], avatar: url);
  }
}
