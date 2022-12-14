import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stisla_app/pages/list.dart';
import 'package:flutter_stisla_app/pages/register.dart';
import 'package:http/http.dart' as http;

import '../service/loginservice.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final txtEmail = TextEditingController(text: 'superadmin@gmail.com');
  final txtPassword = TextEditingController(text: 'password');
  
  LoginPressed() async {
    // if (txtEmail.isNotEmpty && txtPassword.isNotEmpty) {
      http.Response response = await AuthServices.login(txtEmail.text, txtPassword.text);
      Map responseMap = jsonDecode(response.body);
      print(response.body);
      if (response.statusCode == 200) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => ListPage(),
          ),
          (route) => false,
        );
    //   } else {
    //     errorSnackBar(context, 'wrong email or password');
    //   }
    // } else {
    //   errorSnackBar(context, 'enter all required fields');
    // }
  }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Login Screen'),
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold
                ),
              ),
              
              const SizedBox(
                height: 30,
              ),

              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: txtEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String value){
                      },
                      validator: (value){
                        return value!.isEmpty ? 'Please enter email' : null;
                      },
                    ),

                    SizedBox(height: 30,),
                    
                    TextFormField(
                       controller: txtPassword,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter password',
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String value){
                    
                      },
                      validator: (value){
                        return value!.isEmpty ? 'Please enter password' : null;
                      },
                    ),

                    SizedBox(height: 30,),

                    Container(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => const ListPage()),
                          );
                          LoginPressed();
                          },
                        child: Text('Login'),
                        color: Colors.teal,
                        textColor: Colors.white,
                      ),
                    ),

                    SizedBox(height: 15,),

                    Container(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => const RegisterPage()),
                          );
                          },
                        child: Text('Register'),
                        color: Colors.teal,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}