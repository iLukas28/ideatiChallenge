import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ideati_ilukas/api/joke_api.dart';
import 'package:ideati_ilukas/models/joke.dart';

class HomeController extends GetxController {
  bool _loading = false;

  List<Joke> _jokes = [];

  List<dynamic> get jokes => _jokes;

  bool get loading => _loading;

  Future<void> loadJoke() async {
    _loading = true;
    update(['loading']);
    final data = await JokeAPI.instance.getJoke();
    if (data != null) _jokes.add(data);
    sortJokeByLikes();
    _loading = false;
    update(['joke', 'loading']);
  }

  void addLike(index) {
    _jokes[index].likes++;
    sortJokeByLikes();
    update(['joke']);
  }

  void removeLike(index) {
    _jokes[index].likes--;
    sortJokeByLikes();
    update(['joke']);
  }

  void sortJokeByLikes() {
    _jokes.sort((a, b) => b.likes.compareTo(a.likes));
  }
}
