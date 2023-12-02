import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon/view/login.dart';
import 'package:hair_salon/view/main_page.dart';

class MainAuthPage extends StatefulWidget {
  const MainAuthPage({Key? key}) : super(key: key);

  @override
  State<MainAuthPage> createState() => _MainAuthPageState();
}

class _MainAuthPageState extends State<MainAuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasData) {
            try {
              // Uncomment the following lines if you want to print the ID token
              // var user = FirebaseAuth.instance.currentUser;
              // print("____________ $id _____________________");
              var user = FirebaseAuth.instance.currentUser;
              String tooken = "";
              user?.getIdTokenResult().then((result) {
                tooken = result.token!;
              });
              print('IdToken: $tooken');
              return const MainPage();
            } catch (e) {
              return Scaffold(
                body: Center(child: Text(e.toString())),
              );
            }
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
