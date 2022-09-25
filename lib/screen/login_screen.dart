import 'package:bloc_login_authentication/bloc/bloc_login.dart';
import 'package:bloc_login_authentication/screen/register_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LoginBloc>(context, listen: false);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          color: Color(0xfface6ec),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Login", style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold,),),
                SizedBox(height: 20,),
                StreamBuilder(
                  stream: bloc.loginEmail,
                  builder: (context, AsyncSnapshot<String> snapshot) {
                    return TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Enter email",
                        labelText: "email",

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                      ),
                      onChanged: (value)=>bloc.changeloginEmail,
                    );
                  }
                ),
                SizedBox(height: 20,),
                StreamBuilder(
                    stream: bloc.loginPassword,
                    builder: (context, AsyncSnapshot<String> snapshot){
                    return TextField(
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),
                      onChanged: (value)=>bloc.changeloginPassword,
                    );
                  }
                ),
                SizedBox(height: 20,),
                _buildbutton(),
                SizedBox(height: 20,),
                RichText(text: TextSpan(
                  children: [
                    TextSpan(text:("Need an account?"),
                    style: TextStyle(
                      color: Colors.black
                    )),
                    WidgetSpan(child: SizedBox(width: 10,)),
                    TextSpan(text:"Register here", style: TextStyle(
                        color: Colors.black
                    ),
                    recognizer: TapGestureRecognizer()
                    ..onTap=(){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>RegisterPage()));
                        }
                    ),
                  ],
                ),



                    )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildbutton() {
    return GestureDetector(
      onTap: (){
        // TODO: Page Navigation
      },

      child: Container(
        alignment: Alignment.center,
          height: 40,
          width: 120,
          child: Text("Login"),
          decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10),


      )),
    );

  }
}
