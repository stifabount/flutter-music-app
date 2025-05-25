class Music {
  final String id;
  final String title;
  final String filePath; // Local path of downloaded audio
  final String sourceUrl;

  Music({
    required this.id,
    required this.title,
    required this.filePath,
    required this.sourceUrl,
  });

  // Convert to Map for storage
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'filePath': filePath,
        'sourceUrl': sourceUrl,
      };

  // Create from Map
  factory Music.fromJson(Map<String, dynamic> json) => Music(
        id: json['id'],
        title: json['title'],
        filePath: json['filePath'],
        sourceUrl: json['sourceUrl'],
      );
}
