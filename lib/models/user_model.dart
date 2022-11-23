import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? userid; //
  String? username; //
  String? email; //
  String? phonenumber; //
  String? country; //
  String? state; //
  String? zipcode; //
  bool? status; //
  bool? subsccribed; //
  Timestamp? subscrpdate; //
  Timestamp? subscrpexpiredate;
  String? imageurl; ////
  double? amount; //
  Timestamp? date; //

  UserModel(
      {required this.userid,
      required this.username,
      required this.email,
      required this.phonenumber,
      required this.country,
      required this.state,
      required this.zipcode,
      required this.status,
      required this.subsccribed,
      required this.subscrpdate,
      required this.subscrpexpiredate,
      required this.amount,
      required this.imageurl,
      required this.date});
  UserModel.fromMap(Map<String, dynamic> userdata) {
    amount = userdata['amount'];
    country = userdata['country'];
    date = userdata['date'];
    email = userdata['email'];
    imageurl = userdata['imageurl'];
    phonenumber = userdata['phone'];
    state = userdata['state'];
    status = userdata['status'];
    subsccribed = userdata['subscribed'];
    subscrpdate = userdata['subscrpdate'];
    subscrpexpiredate = userdata['subscrpexpiredate'];
    userid = userdata['userid'];
    username = userdata['username'];
    zipcode = userdata['zipcode'];
  }
  Map<String, dynamic> toMap() {
    return {
      'userid': userid,
      'username': username,
      'email': email,
      'country': country,
      'state': state,
      'zipcode': zipcode,
      'status': status,
      'subscribed': subsccribed,
      'subscrpdate': subscrpdate,
      'subscrpexpiredate': subscrpexpiredate,
      'amount': amount,
      'imageurl': imageurl,
      'date': date,
      'phone': phonenumber
    };
  }
}
