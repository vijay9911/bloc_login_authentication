import 'package:rxdart/rxdart.dart';

class RegisterBloc{
final _name = BehaviorSubject<String>();
final _email = BehaviorSubject<String>();
final _phone = BehaviorSubject<String>();
final _password = BehaviorSubject<String>();
final _confirmpassword = BehaviorSubject<String>();

// Getter
  Stream<String> get name => _name.stream;
  Stream<String> get email => _email.stream;
  Stream<String> get phone => _phone.stream;
  Stream<String> get password => _password.stream;
  Stream<String> get confirmpassword => _confirmpassword.stream;

  // setter
  Function(String) get changename=> _name.sink.add;
  Function(String) get changeemail=> _email.sink.add;
  Function(String) get changephone=> _phone.sink.add;
  Function(String) get changepassword=> _password.sink.add;
  Function(String) get changeconfirmpassword=> _confirmpassword.sink.add;

void dispose(){
  _name.close();
  _email.close();
  _phone.close();
  _password.close();
  _confirmpassword.close();
}}