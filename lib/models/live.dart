import 'package:cloud_firestore/cloud_firestore.dart';

class LiveData {
  String? description;
  Timestamp? end;
  String? id;
  String? length;
  Timestamp? start;
  String? thumbnail;
  String? title;
  String? videoID;
  String? playbackLink;
  double? price;

  LiveData(
      {required this.description,
      required this.end,
      required this.id,
      required this.length,
      required this.start,
      required this.thumbnail,
      required this.title,
      required this.playbackLink,
      required this.videoID,
      required this.price});

  LiveData.fromMap(Map<String, dynamic> map) {
    description = map['description'];
    end = map['end'];
    id = map['id'];
    length = map['length'];
    start = map['start'];
    thumbnail = map['thumbnail'];
    title = map['title'];
    playbackLink = map['playback_link'];
    videoID = map['video_id'];
    price = double.parse(map['price'].toString());
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'end': end,
      'id': id,
      'length': length,
      'start': start,
      'thumbnail': thumbnail,
      'title': title,
      'playback_link': playbackLink,
      'video_id': videoID,
      'price': price
    };
  }
}
