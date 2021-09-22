import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailConteroller = TextEditingController();

  var passwordConteroller = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool obsecureTextToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    defaultTextFormField(
                        controller: emailConteroller,
                        keyboardType: TextInputType.emailAddress,
                        labelText: 'Email',
                        onChange: (value) {
                          print(value);
                        },
                        prefixIcon: Icon(Icons.email),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 10.0,
                    ),
                    defaultTextFormField(
                        controller: passwordConteroller,
                        keyboardType: TextInputType.visiblePassword,
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: obsecureTextToggle ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                        obscureText: obsecureTextToggle,
                        suffixFun: () {
                          setState(() {
                            obsecureTextToggle = !obsecureTextToggle;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultButton(
                      buttonFunction: () {
                        if (formKey.currentState!.validate()) {
                          print('email : ${emailConteroller.text}');
                          print('password : ${passwordConteroller.text}');
                        }
                      },
                      buttonText: 'login',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account?'),
                        TextButton(onPressed: () {}, child: Text('Sign up',)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
