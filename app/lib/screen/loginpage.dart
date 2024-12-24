import 'package:app/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage="";
  bool isLogin=true;

  final TextEditingController _controlleremail=TextEditingController();
    final TextEditingController _controllerPassword=TextEditingController();


  Future<void> signInWithEmailAndPassword() async{
    try{
      await Auth().signInWithEmailAndPassword(
        email: _controlleremail.text,
        password: _controllerPassword.text
      );

    }on FirebaseAuthException catch(e){
      setState(() {
        errorMessage=e.message;
      });
    }
  } 

Future<void> createUserWithEmailAndPassword() async{
  try{
    await Auth().createUserWithEmailAndPassword(
      email: _controlleremail.text, 
      password: _controllerPassword.text
      );
  }
  on FirebaseAuthException catch(e){
    setState(() {
      errorMessage=e.message;
    });
  }
}
Widget _title(){
  return const Text('Login');
}

Widget _entryField(String title , TextEditingController controller){
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: title,
    ),
  );
}
Widget _errorMessage(){
  return Text(errorMessage==""?"":"humm ? $errorMessage");
}

Widget _submitButton(){
  return ElevatedButton(
  onPressed: isLogin? signInWithEmailAndPassword: createUserWithEmailAndPassword, 
  child: Text("Submit"),);
}


Widget _loginOrRegisterButton(){
  return TextButton(
    onPressed: (){
      setState(() {
        isLogin=!isLogin;
      });
    }, 
    child: Text( isLogin?"register instead ":"Login Instead"));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _title(),),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _entryField("email", _controlleremail),
            _entryField("password", _controllerPassword),
            _errorMessage(),
            _submitButton(),
            _loginOrRegisterButton(),

          ],
        ),
      ),
    );
  }
}