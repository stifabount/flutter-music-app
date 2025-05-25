class Playlist {
  final String id;
  final String name;
  final List<String> musicIds; // list of music IDs

  Playlist({
    required this.id,
    required this.name,
    required this.musicIds,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'musicIds': musicIds,
      };

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
        id: json['id'],
        name: json['name'],
        musicIds: List<String>.from(json['musicIds']),
      );
}
