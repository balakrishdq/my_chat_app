import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_chat_app/pages/home_page.dart';
import 'package:my_chat_app/states/lib.dart';

class UserName extends StatefulWidget {
  UserName({
    Key? key,
  }) : super(key: key);

  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  final _text = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    _text.text = (FirebaseAuth.instance.currentUser?.displayName != null
        ? FirebaseAuth.instance.currentUser?.displayName
        : '')!;
    super.initState();
  }

  // void createUserInFirestore() {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CupertinoButton(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 20.0,
              ),
              child: Observer(
                builder: (BuildContext context) => CircleAvatar(
                  radius: 60,
                  child: userState.imagefile != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            userState.imagefile!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(50)),
                          width: 100,
                          height: 100,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey[800],
                          ),
                        ),
                ),
              ),
            ),
            onPressed: () => userState.takeImageFromCamera(),
          ),
          Text('Enter your Name'),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 55,
              vertical: 15,
            ),
            child: CupertinoTextField(
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
              maxLength: 15,
              controller: _text,
              keyboardType: TextInputType.name,
              autofillHints: <String>[AutofillHints.name],
            ),
          ),
          CupertinoButton.filled(
              child: Text('Continue'),
              onPressed: () {
                FirebaseAuth.instance.currentUser!
                    .updateDisplayName(_text.text);

                userState.createOrUpdateUserInFireStore(_text.text);
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => Homepage()));
              })
        ],
      ),
    );
  }
}
