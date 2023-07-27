// ignore_for_file: sized_box_for_whitespace, no_logic_in_create_state

import 'dart:developer';

import 'package:emodian/realm/realm.dart';
import 'package:emodian/schemas/globalchat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:realm/realm.dart';

class ChatBloc {
  final RealmResults<GlobalChat> chats;

  ChatBloc(this.chats) : _realm = chats.realm;
  final Realm _realm;

  addnewchat(datetime, messagebody) {
    _realm.write(
      () => _realm.add(
        GlobalChat(
          ObjectId(),
          datetime,
          messagebody,
          RealmServices.database.profile.email.toString(),
          'TextMessage',
          attachements: ['null'],
          delivery: ['null'],
        ),
      ),
    );
  }
}

class ChatView extends StatefulWidget {
  const ChatView({super.key, required this.bloc});
  final ChatBloc bloc;

  @override
  State<ChatView> createState() => _ChatViewState(bloc);
}

class _ChatViewState extends State<ChatView> {
  _ChatViewState(this.bloc);
  final ChatBloc bloc;
  final messagecntrl = TextEditingController();
  final chatcntrl = ScrollController(keepScrollOffset: false);
  @override
  void dispose() {
    super.dispose();
    messagecntrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Global Chat')),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: bloc.chats.changes,
              builder: (context, streamdat) {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  chatcntrl.jumpTo(chatcntrl.position.maxScrollExtent);
                });

                log('${bloc.chats}');
                if (bloc.chats.isEmpty) {
                  return const Text('no Chats');
                }
                return ListView.builder(
                  controller: chatcntrl,
                  itemCount: bloc.chats.length,
                  itemBuilder: (context, index) {
                    if (bloc.chats[index].from ==
                        RealmServices.database.profile.email) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                            padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  bloc.chats[index].messagebody,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                  ),
                                ),
                                Text(
                                  '${DateTime.parse(bloc.chats[index].datetime).hour}:${DateTime.parse(bloc.chats[index].datetime).minute}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                    return Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                bloc.chats[index].messagebody,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                '${DateTime.parse(bloc.chats[index].datetime).hour}:${DateTime.parse(bloc.chats[index].datetime).minute}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              Expanded(
                // height: double.z,
                // width: MediaQuery.sizeOf(context).width - 100,
                child: TextField(
                  onTap: () {
                    chatcntrl.jumpTo(chatcntrl.position.maxScrollExtent);
                  },
                  controller: messagecntrl,
                  decoration: const InputDecoration(
                    label: Text('Type Mesage'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  bloc.addnewchat(DateTime.now().toString(), messagecntrl.text);
                },
                icon: const Icon(Icons.send),
              )
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
