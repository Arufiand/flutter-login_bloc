import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();

  // Provider({required Key super.key, required super.child});
  // Provider({Key key, Widget child}) : super(key: key, child: child);
  Provider({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(oldWidget) => true;

  static Bloc of(BuildContext context){
    return (
    context.dependOnInheritedWidgetOfExactType<Provider>() as Provider
    ).bloc;
  }
}