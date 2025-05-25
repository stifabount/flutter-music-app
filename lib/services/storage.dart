import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/music.dart';
import '../models/playlist.dart';

class StorageService {
  static const _musicKey = 'all_music';
  static const _playlistKey = 'all_playlists';

  static Future<void> saveMusicList(List<Music> list) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = list.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList(_musicKey, encoded);
  }

  static Future<List<Music>> loadMusicList() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = prefs.getStringList(_musicKey) ?? [];
    return encoded.map((e) => Music.fromJson(json.decode(e))).toList();
  }

  static Future<void> savePlaylists(List<Playlist> list) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = list.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList(_playlistKey, encoded);
  }

  static Future<List<Playlist>> loadPlaylists() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = prefs.getStringList(_playlistKey) ?? [];
    return encoded.map((e) => Playlist.fromJson(json.decode(e))).toList();
  }
}
