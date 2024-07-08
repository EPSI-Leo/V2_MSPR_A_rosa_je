import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String text;
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String receiverEmail;
  final Timestamp timestamp;

  Message({
    required this.text,
    required this.senderId,
    required this.senderEmail,
    required this.receiverId,
    required this.receiverEmail,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'senderID': senderId,
      'senderEmail': senderEmail,
      'receiverID': receiverId,
      'receiverEmail': receiverEmail,
      'timestamp': timestamp,
    };
  }
}
