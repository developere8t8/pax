import 'package:cloud_firestore/cloud_firestore.dart';

class VideoPaymentData {
  double? amount;
  Timestamp? endDate;
  String? id;
  Timestamp? paidDate;
  bool? seen;
  String? userid;
  String? videoid;

  VideoPaymentData(
      {required this.amount,
      required this.endDate,
      required this.id,
      required this.paidDate,
      required this.seen,
      required this.userid,
      required this.videoid});
  VideoPaymentData.fromMap(Map<String, dynamic> map) {
    amount = double.parse(map['amount'].toString());
    endDate = map['end_date'];
    id = map['id'];
    paidDate = map['paid_date'];
    seen = map['seen'];
    userid = map['user_id'];
    videoid = map['video_id'];
  }

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'end_date': endDate,
      'id': id,
      'paid_date': paidDate,
      'seen': seen,
      'user_id': userid,
      'video_id': videoid
    };
  }
}
