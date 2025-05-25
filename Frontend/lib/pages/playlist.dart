import 'package:flutter/material.dart';

class PlaylistPage extends StatelessWidget {
  final List<String> playlists = ['Workout', 'Chill', 'Study'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Playlists")),
      body: ListView.builder(
        itemCount: playlists.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(playlists[index]),
          leading: Icon(Icons.queue_music),
        ),
      ),
    );
  }
}
