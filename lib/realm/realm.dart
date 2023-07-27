import 'dart:developer';
import 'package:realm/realm.dart';

import '../schemas/globalchat.dart';

class RealmServices {
  static String appId = "application-0-hsgrx";
  static String apikey =
      'CSwbEJ7LKkTk94AfOEoGiYPVLRK0s7PgUEhDpMLjmYhjOFChpECSjM4OIIlLt5yZ';


  static late App app;
  static late User database;
  static late Realm realm;

  static Future initializeServer() async {
    try {
        app =  App(AppConfiguration(appId));
    } catch (e) {
      return ('MongoDb Error : ${e.toString()}.');
    }
  } 


   static Future loginwithemailpassword(String email , password) async {
    try {
      database = await app.logIn(Credentials.emailPassword(email,password));
      log('MongoDb Error : ${ database.state.toString()}.');
      await startSyncs();
      return database.state.toString();
    } catch (e) {
      log('MongoDb Error : ${e.toString()}.');
      return ('MongoDb Error : ${e.toString()}.');
    }
  } 

  static startSyncs() async {
    realm = Realm(
      Configuration.flexibleSync(
        database,
        [
          GlobalChat.schema,
        ],
      ),
    );
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm.all<GlobalChat>());
    });
    log('sync state${database.state}');
    log('sync state ${realm.syncSession.connectionState}');
  }
 

static RealmResults<GlobalChat> chats = realm.all<GlobalChat>();
}
