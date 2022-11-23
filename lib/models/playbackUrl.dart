class PlayBackData {
  String? hls;

  PlayBackData({required this.hls});

  factory PlayBackData.fromJson(Map<String, dynamic> json) {
    return PlayBackData(hls: json['hls']);
  }
}
