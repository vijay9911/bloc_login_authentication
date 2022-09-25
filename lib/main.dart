import 'package:bloc_login_authentication/bloc/bloc_login.dart';
import 'package:bloc_login_authentication/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc/bloc_register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       Provider<LoginBloc>(create: (context)=> LoginBloc()),
        Provider<RegisterBloc>(create: (context)=> RegisterBloc()),

      ],
      child: MaterialApp(
        theme: ThemeData(

          visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        home: LoginPage(),
      ),
    );
  }
}

