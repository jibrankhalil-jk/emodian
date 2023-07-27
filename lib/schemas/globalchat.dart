import 'package:realm/realm.dart';
part 'globalchat.g.dart';

@RealmModel()
class _GlobalChat {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;
  late String datetime;
  late String messagebody;
  late String from;
  late List<String> attachements;
  late String type;
  late List<String> delivery;
}
