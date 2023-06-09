import 'package:cloud_firestore/cloud_firestore.dart';

import 'SignUpModel.dart';

Future addUser(Users user) async {
  final docUser = FirebaseFirestore.instance.collection("users").doc();
  user.id = docUser.id;
  await docUser.set(user.toJson());
}

//--------------------------------------------------
Future updateUser(Users user) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc(user.id);
  await docUser.update(user.toJson());
}

//---------------------------------
Future deleteUser(String id) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc(id);
  await docUser.delete();
}
