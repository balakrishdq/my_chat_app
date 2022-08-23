import 'package:flutter/cupertino.dart';
import 'package:my_chat_app/pages/login/user_name.dart';
import 'package:my_chat_app/screens/call_screen.dart';
import 'package:my_chat_app/screens/chat_screen.dart';
import 'package:my_chat_app/screens/person_screen.dart';
import 'package:my_chat_app/screens/settings_screen.dart';
import 'package:my_chat_app/states/lib.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var screens = [
    ChatScreen(),
    CallScreen(),
    PersonScreen(),
    UserName(),
  ];

  @override
  void initState() {
    super.initState();
    chatState.refreshChatsForCurrentUser();
    userState.initUserListener();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              label: 'chats',
              icon: Icon(
                CupertinoIcons.chat_bubble_2_fill,
              ),
            ),
            BottomNavigationBarItem(
              label: 'calls',
              icon: Icon(
                CupertinoIcons.phone,
              ),
            ),
            BottomNavigationBarItem(
              label: 'people',
              icon: Icon(
                CupertinoIcons.person_alt_circle,
              ),
            ),
            BottomNavigationBarItem(
              label: 'settings',
              icon: Icon(
                CupertinoIcons.settings,
              ),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return screens[index];
        },
      ),
    );
  }
}
