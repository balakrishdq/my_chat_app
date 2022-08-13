import 'package:flutter/cupertino.dart';
import 'package:my_chat_app/screens/call_screen.dart';
import 'package:my_chat_app/screens/chat_screen.dart';
import 'package:my_chat_app/screens/person_screen.dart';
import 'package:my_chat_app/screens/settings_screen.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  var screens = [
    ChatScreen(),
    CallScreen(),
    PersonScreen(),
    SettingsScreen(),
  ];

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
