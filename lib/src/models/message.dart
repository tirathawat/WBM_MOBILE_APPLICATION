import 'package:flutter/material.dart';
import 'package:WBM_platform/src/config/utils.dart';

class MessageField {
  static final String createdAt = 'createdAt';
}

class Message {
  final String name;
  final String message;
  final DateTime createdAt;

  const Message({
    @required this.name,
    @required this.message,
    @required this.createdAt,
  });

  static Message fromJson(Map<String, dynamic> json) => Message(
        name: json['name'],
        message: json['message'],
        createdAt: Utils.toDateTime(json['createdAt']),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'message': message,
        'createdAt': Utils.fromDateTimeToJson(createdAt),
      };
}