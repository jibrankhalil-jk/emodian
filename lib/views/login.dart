// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:emodian/views/chatview.dart';
import 'package:flutter/material.dart';

import '../realm/realm.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emalicntrl = TextEditingController();
  final passwordicntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login to global chat'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: emalicntrl,
              decoration: const InputDecoration(
                label: Text('Email'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordicntrl,
              decoration: const InputDecoration(
                label: Text('Password'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () async {
                log('''
                    email : ${emalicntrl.text}
                    password : ${passwordicntrl.text}
                    ''');

                    showDialog(context: context, builder: (context) => AlertDialog(title: Text('PLease Wait'),),);


                await RealmServices.loginwithemailpassword(
                    emalicntrl.text, passwordicntrl.text,);

                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatView(bloc: ChatBloc( RealmServices.chats ),),
                  ),
                );
              },
              child: const Text('Login'),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
