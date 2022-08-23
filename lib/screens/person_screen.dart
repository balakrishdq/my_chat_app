import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_chat_app/screens/chat_details.dart';
import 'package:my_chat_app/states/lib.dart';

class PersonScreen extends StatelessWidget {
  PersonScreen({Key? key}) : super(key: key);

  var currentUser = FirebaseAuth.instance.currentUser?.uid;

  void callChatDetailScreen(BuildContext context, String name, String uid) {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => ChatDetails(
                  friendName: name,
                  friendUid: uid,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .where('uid', isNotEqualTo: currentUser)
            .snapshots(includeMetadataChanges: true),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("something went wrong"));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          if (snapshot.hasData) {
            return CustomScrollView(
              slivers: [
                CupertinoSliverNavigationBar(
                  largeTitle: Text("People"),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      return Observer(
                          builder: (BuildContext context) => CupertinoListTile(
                                leading: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                    userState.users[data['uid']]['picture'] !=
                                            null
                                        ? userState.users[data['uid']]
                                            ['picture']
                                        : '',
                                  ),
                                ),
                                onTap: () => callChatDetailScreen(
                                    context,
                                    userState.users[data['uid']]['name'] != null
                                        ? userState.users[data['uid']]['name']
                                        : '',
                                    data['uid']),
                                title: Text(
                                    userState.users[data['uid']]['name'] != null
                                        ? userState.users[data['uid']]['name']
                                        : ''),
                                subtitle: Text(userState.users[data['uid']]
                                            ['status'] !=
                                        null
                                    ? userState.users[data['uid']]['status']
                                    : ''),
                              ));
                    }).toList(),
                  ),
                ),
              ],
            );
          }
          return Container();
        });
  }
}
