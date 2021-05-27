// TODO Implement this library.
import 'package:markit/admin/home.dart';
//import 'package:markit/admin/screens/admin.dart';
import 'package:markit/helpers/style.dart';
import 'package:markit/provider/user.dart';
import 'package:markit/screens/home.dart';
import 'package:markit/screens/signup.dart';
import 'package:markit/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:markit/admin/screens/dashboard.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      body:user.status == Status.Authenticating ? Loading() :

      Center(
        child: Stack(
          children: <Widget>[
            Container(

                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[350],
                        blurRadius:
                        20.0, // has the effect of softening the shadow
                      )
                    ],
                  ),
                  child: Form(
                      key: _formKey,
                      child: ListView(
                        children: <Widget>[
                          //SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                                alignment: Alignment.topCenter,
                                child: Image.asset(
                                  'assets/images/logo.png',
                                )),
                          ),

                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.grey.withOpacity(0.3),
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: TextFormField(
                                  controller: _email,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    icon: Icon(Icons.alternate_email,),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      Pattern pattern =
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                      RegExp regex = new RegExp(pattern);
                                      if (!regex.hasMatch(value))
                                        return 'Please make sure your email address is valid';
                                      else
                                        return null;
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.grey.withOpacity(0.3),
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: TextFormField(
                                  controller: _password,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    icon: Icon(Icons.lock_outline),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "The password field cannot be empty";
                                    } else if (value.length < 6) {
                                      return "the password has to be at least 6 characters long";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: MaterialButton(
                              color: Colors.red.shade900,
                              onPressed: () async{
                                if(_formKey.currentState.validate()){
                                  if(!await user.signIn(_email.text, _password.text)){
                                    _key.currentState.showSnackBar(SnackBar(content: Text("Sign in failed")));}
                                  else{
                                      // Navigator.push(
                                      // context,
                                      // MaterialPageRoute(
                                      // builder: (context) => SignUp()));
                                                                      }
                                }
                              },
                              //minWidth: MediaQuery.of(context).size.width,

                              child: Text(
                                "Login",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Forgot password",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),

                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => SignUp()));
                                      },
                                      child: Text(
                                        "Create an account",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.black),
                                      ))),

                            ],
                          ),

                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Admin()));
                                  },
                                  child: Text(
                                    "Admin",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black),
                                  ))),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MaterialButton(
                                  color: Colors.red,
                                  elevation: 0.0,
                                  onPressed:() {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Admin()));
                                        },
                                        child: Text(
                                          "Skip",
                                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                        ),
                                ),
                            ),
                          ),
//                        Padding(
//                          padding: const EdgeInsets.all(16.0),
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: <Widget>[
//
//                              Padding(
//                                padding: const EdgeInsets.all(8.0),
//                                child: Text("or sign in with", style: TextStyle(fontSize: 18,color: Colors.grey),),
//                              ),
//                              Padding(
//                                padding: const EdgeInsets.all(8.0),
//                                child: MaterialButton(
//                                    onPressed: () {},
//                                    child: Image.asset("images/ggg.png", width: 30,)
//                                ),
//                              ),
//
//                            ],
//                          ),
//                        ),

                        ],
                      )),


            ),
          ],
        ),
      ),


    );
  }

}
