import 'package:flutter_tts/flutter_tts.dart';

class TTSManager {
  TTSManager._privateConstructor();
  static final TTSManager _instance = TTSManager._privateConstructor();
  factory TTSManager() {
    return _instance;
  }
  FlutterTts flutterTts;

  Future speakText(String text) async {
    if (flutterTts == null) {
      flutterTts = new FlutterTts();
    }
    if (text != null) {
      if (text.isNotEmpty) {
        await flutterTts.speak(text);
      }
    }
  }
}
