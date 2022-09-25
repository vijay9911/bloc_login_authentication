import 'package:bloc_login_authentication/screen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/bloc_register.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RegisterBloc>(context, listen: false);
    bool isVisible= true;
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
                const Text("Register", style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold,),),
                SizedBox(height: 20,),

                StreamBuilder<Object>(
                  stream: bloc.name,
                    builder: (context,  snapshot) {
                    return TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: "Enter Name",
                          labelText: "name",

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),
                      onChanged: (value) => bloc.name,
                    );
                  }
                ),
                SizedBox(height: 20,),
                StreamBuilder<Object>(
                  stream: bloc.email,
                  builder: (context, snapshot) {
                    return TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Enter email",
                          labelText: "email",

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),
                        onChanged:  (value) => bloc.changeemail,
                    );
                  }
                ),
                SizedBox(height: 20,),
                StreamBuilder<Object>(
                  stream: bloc.phone,
                  builder: (context, snapshot) {
                    return TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: "Phone Number",
                          labelText: "phone number",

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),
                      onChanged:  (value) => bloc.changephone,
                    );
                  }
                ),
                SizedBox(height: 20,),

                StreamBuilder<Object>(
                  stream: bloc.password,
                  builder: (context, snapshot) {
                    return TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Password",
                          labelText: "password",

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),
                      onChanged:  (value) => bloc.changepassword,
                    );
                  }
                ),
                SizedBox(height: 20,),
                StreamBuilder<Object>(
                  stream: bloc.confirmpassword,
                  builder: (context, snapshot) {
                    return TextField(
                      obscureText: isVisible,
                      keyboardType: TextInputType.emailAddress,

                      decoration: InputDecoration(
                          hintText: "Confirm password",
                          labelText: "confirm password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        suffixIcon:  IconButton( icon: isVisible
                            ?Icon(Icons.visibility_off):Icon(Icons.visibility)
                            ,
                          onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                          },)
                      ),
                      onChanged:  (value) => bloc.changeconfirmpassword,
                    );
                  }
                ),
                SizedBox(height: 20,),
                _buildbutton(),
                SizedBox(height: 20,),
                RichText(text: TextSpan(
                  children: [
                    TextSpan(text:("Already hane an account?"),
                        style: TextStyle(
                            color: Colors.black
                        )),
                    WidgetSpan(child: SizedBox(width: 10,)),
                    TextSpan(text:"Login here", style: TextStyle(
                        color: Colors.black
                    ),
                        recognizer: TapGestureRecognizer()
                          ..onTap=(){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage()));
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
        child: Text("Register"),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10),


        )),
  );

}}


