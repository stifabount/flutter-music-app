import 'package:flutter/material.dart';

class AllMusicPage extends StatefulWidget {
  @override
  _AllMusicPageState createState() => _AllMusicPageState();
}

class _AllMusicPageState extends State<AllMusicPage> {
  List<String> musicList = [];

  void _addMusic() async {
    TextEditingController controller = TextEditingController();
    String? link = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add YouTube Link'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: "Paste YouTube link here"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, null),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: Text("Download"),
          ),
        ],
      ),
    );

    if (link != null && link.isNotEmpty) {
      // Simulate adding music
      setState(() {
        musicList.add("Downloaded: ${link.substring(0, 20)}...");
      });

      // TODO: Call background download service here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Music")),
      body: ListView.builder(
        itemCount: musicList.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(musicList[index]),
          leading: Icon(Icons.audiotrack),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addMusic,
        child: Icon(Icons.add),
      ),
    );
  }
}
