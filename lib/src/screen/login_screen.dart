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
           submitButton(bloc)
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

  Widget submitButton(Bloc bloc) {
    return StreamBuilder<bool>(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return ElevatedButton(
          autofocus: true,
          onPressed: (snapshot.hasData && snapshot.data == true)
              ? () {
            bloc.submit();
          }
              : null, // Disable button if there's an error or no valid data
          child: const Text('Submit'),
        );
      },
    );
  }


}