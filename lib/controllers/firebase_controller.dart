import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future connectToFirebaseEmulator() async {
  final fireStorePort = "8080";

  final localHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  FirebaseFirestore.instance.settings = Settings(
      host: "$localHost:$fireStorePort",
      sslEnabled: false,
      persistenceEnabled: false);

  FirebaseAuth.instance.useAuthEmulator('localHost', 9099);
}
