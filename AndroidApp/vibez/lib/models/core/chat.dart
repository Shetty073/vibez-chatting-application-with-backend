import 'package:hive/hive.dart';
import 'package:vibez/models/core/message.dart';
import 'package:vibez/models/core/user.dart';

part 'chat.g.dart';

// flutter pub run build_runner build
@HiveType(typeId: 1)
class Chat {
  @HiveField(0)
  User userOne;

  @HiveField(1)
  User userTwo;

  @HiveField(2)
  List<Message> messages;
}