import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../loginSingUp/SignUpModel.dart';
import 'UserDetaile.dart';

class DetaileUser extends StatefulWidget {
  const DetaileUser({Key? key}) : super(key: key);

  @override
  State<DetaileUser> createState() => _DetaileUserState();
}

class _DetaileUserState extends State<DetaileUser> {
  @override
  Widget build(BuildContext context) {
    // Assuming you have the user's login information
    bool isLoggedIn = true; // Replace this with your actual login status logic

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('loggedIn',
                isEqualTo: isLoggedIn) // Filter based on the login status
            .limit(1) // Limit to one document
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error'),
            );
          }
          if (snapshot.hasData) {
            final userDocs = snapshot.data!.docs;
            if (userDocs.isEmpty) {
              return Center(
                child: Text('No user found.'),
              );
            }
            final userData =
                Users.fromJson(userDocs[0].data() as Map<String, dynamic>);
            return ListUser(
              user: userData,
              users: [],
            ); // Pass the user data to your ListUser widget
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
