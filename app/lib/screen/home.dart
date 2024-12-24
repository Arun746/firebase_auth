import 'package:app/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

final User? user= Auth().currentUser;

Future<void> signOut()async{
  await Auth().signOut();
}

Widget _title(){
  return const Text("Auth");
}
Widget _userid(){
  return  Text(user?.email?? "User");
}

Widget _signOutButton(){
  return ElevatedButton(onPressed: signOut, child: Text("Sign Out"),);
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _userid(),
            _signOutButton()
          ],
        ),
      ),
    );
  }
}