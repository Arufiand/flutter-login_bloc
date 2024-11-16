import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators {
  final _email = StreamController<String>.broadcast();
  final _password = StreamController<String>.broadcast();

  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => Rx.combineLatest2(email, password, (String e, String p) => true);

  Function(String) get emailChange => _email.sink.add;
  Function(String) get passwordChange => _password.sink.add;

  dispose(){
    _email.close();
    _password.close();
  }
}

final bloc = Bloc();