import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  final String name;
  final String message;
  final DateTime createdAt;
  final String email;
  final String id;
  final String uid;

  CommentModel({
    required this.uid,
    required this.id,
    required this.name,
    required this.message,
    required this.createdAt,
    required this.email,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      uid: json['uid']?.toString() ?? '',
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      message: json['message']?.toString() ?? '',
      createdAt: _parseDate(json['createdAt']),
      email: json['email']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'id': id,
      'name': name,
      'message': message,
      'createdAt': Timestamp.fromDate(createdAt),
      'email': email,
    };
  }

  factory CommentModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;

    return CommentModel(
      uid: data?['uid']?.toString() ?? '',
      id: doc.id,
      name: data?['name']?.toString() ?? '',
      email: data?['email']?.toString() ?? '',
      message: data?['message']?.toString() ?? '',
      createdAt: _parseDate(data?['createdAt']),
    );
  }

  static DateTime _parseDate(dynamic date) {
    if (date is Timestamp) return date.toDate();
    if (date is String) return DateTime.tryParse(date) ?? DateTime.now();
    return DateTime.now();
  }
}
