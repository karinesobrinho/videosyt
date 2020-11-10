class Video {
  final String id;
  final String title;
  final String channel;
  final String thumb;

  Video({this.id, this.title, this.channel, this.thumb});

  factory Video.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('id')) {
      return Video(
        id: json['id']['videoId'],
        title: json['snippet']['title'],
        channel: json['snippet']['channelTitle'],
        thumb: json['snippet']['thumbnails']['high']['url'],
      );
    } else {
      return Video(
        id: json['videoId'],
        title: json['title'],
        channel: json['channel'],
        thumb: json['thumb'],
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'videoId': id,
      'title': title,
      'thumb': thumb,
      'channel': channel,
    };
  }
}
