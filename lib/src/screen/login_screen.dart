import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(context){
     return Container(
       margin: const EdgeInsets.all(20.0),
       child: Column(
         children: [
           emailField(),
           passwordField(),
           Container(margin: const EdgeInsets.only(top: 25.0),),
           submitButton()
         ],
       ),
     );
  }


  Widget emailField(){
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot){
          return TextField(
            onChanged: bloc.emailChange,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email Label',
              hintText: 'Email Hint',
              errorText: snapshot.error as String?
            ),
          );
        }
    );
  }
  Widget passwordField(){

    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot){
          return TextField(
            onChanged: bloc.passwordChange,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password Label',
              hintText: 'Password Hint',
              errorText: snapshot.error as String?
            )
          );
        }
    )
  }

  Widget submitButton(){
    return ElevatedButton(
      autofocus: true,
        onPressed : () {
          // formKey.currentState?.reset(); // To reset the form

        },
        child : const Text('Submit')
    );
  }

}