import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_chat_app/screens/chat_details.dart';
import 'package:my_chat_app/states/lib.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
    return Observer(
      builder: (BuildContext context) => CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text("Chats"),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
                chatState.messages.values.toList().map((data) {
              return Observer(
                  builder: (BuildContext context) => CupertinoListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                            userState.users[data['friendUid']]['picture'] !=
                                    null
                                ? userState.users[data['friendUid']]['picture']
                                : '',
                          ),
                        ),
                        onTap: () => callChatDetailScreen(
                            context,
                            userState.users[data['friendUid']]['name'] != null
                                ? userState.users[data['friendUid']]['name']
                                : '',
                            data['uid']),
                        title: Text(
                            userState.users[data['friendUid']]['name'] != null
                                ? userState.users[data['friendUid']]['name']
                                : ''),
                        subtitle: Text(
                            userState.users[data['friendUid']]['status'] != null
                                ? userState.users[data['friendUid']]['status']
                                : ''),
                      ));
            }).toList()),
          ),
        ],
      ),
    );
  }
}
