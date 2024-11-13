import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(context){
    final bloc = Provider.of(context);

     return Container(
       margin: const EdgeInsets.all(20.0),
       child: Column(
         children: [
           emailField(bloc),
           passwordField(bloc),
           Container(margin: const EdgeInsets.only(top: 25.0),),
           submitButton()
         ],
       ),
     );
  }


  Widget emailField(Bloc bloc){
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
  Widget passwordField(Bloc bloc){

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