import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_chat_app/pages/home_page.dart';

class UserName extends StatelessWidget {
  UserName({
    Key? key,
  }) : super(key: key);
  final _text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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

                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => Homepage()));
              })
        ],
      ),
    );
  }
}
