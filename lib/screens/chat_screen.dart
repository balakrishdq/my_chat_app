import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("chats")
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
                  largeTitle: Text("Chats"),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return CupertinoListTile(
                        title: Text(data['title']),
                      );
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



// CustomScrollView(
//       slivers: [
//         CupertinoSliverNavigationBar(
//           largeTitle: Text('Chats'),
//         ),
//         SliverList(
//             delegate: SliverChildListDelegate([
//           CupertinoListTile(
//             title: Text('Chat 1'),
//           ),
//           CupertinoListTile(
//             title: Text('Chat 2'),
//           ),
//           CupertinoListTile(
//             title: Text('Chat 3'),
//           ),
//           CupertinoListTile(
//             title: Text('Chat 4'),
//           ),
//         ]))
//       ],
//     );