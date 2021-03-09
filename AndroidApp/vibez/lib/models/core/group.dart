import 'package:hive/hive.dart';
import 'package:vibez/models/core/message.dart';
import 'package:vibez/models/core/user.dart';

part 'group.g.dart';

// flutter pub run build_runner build
@HiveType(typeId: 2)
class Group {
  @HiveField(0)
  String name;

  @HiveField(1)
  List<User> members;

  @HiveField(2)
  List<Message> messages;
}