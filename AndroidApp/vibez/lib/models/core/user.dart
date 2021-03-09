import 'package:hive/hive.dart';

part 'user.g.dart';

// flutter pub run build_runner build
@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String name;

  @HiveField(1)
  String email;

  @HiveField(2)
  DateTime lastseen;

  @HiveField(3)
  List chats;

  @HiveField(4)
  List groups;

  @HiveField(5)
  bool isBot;
}