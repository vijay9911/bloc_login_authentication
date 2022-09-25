import 'dart:async';
import 'package:rxdart/rxdart.dart';

class LoginBloc{
  final _loginEmail = BehaviorSubject<String>();
  final _loginPassword = BehaviorSubject<String>();

//getter
 Stream<String> get loginEmail=>_loginEmail.stream;
 Stream<String> get loginPassword=>_loginPassword.stream;
//setter
  Function(String) get changeloginEmail=> _loginEmail.sink.add;
  Function(String) get changeloginPassword=> _loginPassword.sink.add;
void Dispose(){
  _loginEmail.close();
  _loginPassword.close();

}}