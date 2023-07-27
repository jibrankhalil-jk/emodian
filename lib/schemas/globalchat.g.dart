// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'globalchat.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class GlobalChat extends _GlobalChat
    with RealmEntity, RealmObjectBase, RealmObject {
  GlobalChat(
    ObjectId id,
    String datetime,
    String messagebody,
    String from,
    String type, {
    Iterable<String> attachements = const [],
    Iterable<String> delivery = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'datetime', datetime);
    RealmObjectBase.set(this, 'messagebody', messagebody);
    RealmObjectBase.set(this, 'from', from);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set<RealmList<String>>(
        this, 'attachements', RealmList<String>(attachements));
    RealmObjectBase.set<RealmList<String>>(
        this, 'delivery', RealmList<String>(delivery));
  }

  GlobalChat._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get datetime =>
      RealmObjectBase.get<String>(this, 'datetime') as String;
  @override
  set datetime(String value) => RealmObjectBase.set(this, 'datetime', value);

  @override
  String get messagebody =>
      RealmObjectBase.get<String>(this, 'messagebody') as String;
  @override
  set messagebody(String value) =>
      RealmObjectBase.set(this, 'messagebody', value);

  @override
  String get from => RealmObjectBase.get<String>(this, 'from') as String;
  @override
  set from(String value) => RealmObjectBase.set(this, 'from', value);

  @override
  RealmList<String> get attachements =>
      RealmObjectBase.get<String>(this, 'attachements') as RealmList<String>;
  @override
  set attachements(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  String get type => RealmObjectBase.get<String>(this, 'type') as String;
  @override
  set type(String value) => RealmObjectBase.set(this, 'type', value);

  @override
  RealmList<String> get delivery =>
      RealmObjectBase.get<String>(this, 'delivery') as RealmList<String>;
  @override
  set delivery(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<GlobalChat>> get changes =>
      RealmObjectBase.getChanges<GlobalChat>(this);

  @override
  GlobalChat freeze() => RealmObjectBase.freezeObject<GlobalChat>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(GlobalChat._);
    return const SchemaObject(
        ObjectType.realmObject, GlobalChat, 'GlobalChat', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('datetime', RealmPropertyType.string),
      SchemaProperty('messagebody', RealmPropertyType.string),
      SchemaProperty('from', RealmPropertyType.string),
      SchemaProperty('attachements', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('type', RealmPropertyType.string),
      SchemaProperty('delivery', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
    ]);
  }
}
