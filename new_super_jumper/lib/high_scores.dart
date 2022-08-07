import 'package:shared_preferences/shared_preferences.dart';

class HighScores {
  static late final SharedPreferences prefs;
  static final highScores = List.filled(5, 0, growable: false);

  static Future<void> load() async {
    prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < 5; i++) {
      int score = prefs.getInt('score$i') ?? 0;
      highScores[i] = score;
    }
  }

  static Future<void> saveNewScore(int score) async {
    for (int i = 0; i < 5; i++) {
      if (highScores[i] < score) {
        for (int j = 4; j > i; j--) {
          highScores[j] = highScores[j - 1];
        }
        highScores[i] = score;
        break;
      }
    }

    for (int i = 0; i < 5; i++) {
      await prefs.setInt('score$i', highScores[i]);
    }
  }
}
