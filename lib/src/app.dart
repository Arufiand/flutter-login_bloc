import 'package:flutter/material.dart';
import 'screen/login_screen.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  build(context){
    return const MaterialApp(
      title: 'Log Me In',
      home : Scaffold(
        body: LoginScreen(),
      )
    );
  }
}