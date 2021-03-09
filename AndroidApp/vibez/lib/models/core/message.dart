import 'package:hive/hive.dart';
import 'package:vibez/models/core/user.dart';

part 'message.g.dart';

// flutter pub run build_runner build
@HiveType(typeId: 2)
class Message {
  @HiveField(0)
  String message;

  @HiveField(1)
  User author;

  @HiveField(2)
  DateTime timestamp;

  // If a message is tagged in reply
  @HiveField(3)
  Message replyTo;

  @HiveField(4)
  bool isRead;
}