import 'package:flutter/material.dart';

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
    return const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Label',
        hintText: 'Email Hint',
      ),
      // validator: (value) => validateField('email', value!),
      // onSaved: (value){
      //   password = value!;
      // },
    );
  }
  Widget passwordField(){
    return const TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password Label',
        hintText: 'Password Hint',
      )
    );
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