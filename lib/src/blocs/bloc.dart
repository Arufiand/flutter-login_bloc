import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => Rx.combineLatest2(email, password, (String e, String p) => true);

  Function(String) get emailChange => _email.sink.add;
  Function(String) get passwordChange => _password.sink.add;

  submit(){
    final validEmail = _email.value;
    final validPassword = _password.value;

    print('email and password are $validEmail and $validPassword');
  }

  dispose(){
    _email.close();
    _password.close();
  }
}

final bloc = Bloc();