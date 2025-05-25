import 'dart:async';
import 'package:uuid/uuid.dart';
import '../models/music.dart';

class DownloadService {
  static Future<Music> downloadFromYoutube(String url) async {
    // Simulate downloading...
    await Future.delayed(Duration(seconds: 3)); // simulate delay

    final id = const Uuid().v4();
    final title = "Music ${url.substring(0, 10)}";
    final fakePath = "/storage/emulated/0/Music/$id.mp3"; // Simulate local path

    return Music(
      id: id,
      title: title,
      filePath: fakePath,
      sourceUrl: url,
    );
  }
}
