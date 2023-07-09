import 'package:demo2/CommanWigets/commanButton.dart';
import 'package:demo2/CommanWigets/commanTextfeild.dart';
import 'package:demo2/forget.dart';
import 'package:demo2/profile.dart';
import 'package:demo2/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// void main() {
//   runApp(Login());
// }

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailcontroller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void navigateTotheNextPage(BuildContext context, String data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            Profile(email: emailcontroller.text, name: "", phone: ""),
      ),
    );
  }

  void _login() {
    // Validate the form fields
    if (_formKey.currentState!.validate()) {
      // Form fields are valid, perform login action
      print("Ok");
      navigateTotheNextPage(context, emailcontroller.text);
    } else {
      print("error");
    }
  }

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text('Welcome to Login Screen'),
          backgroundColor: Color.fromARGB(255, 47, 175, 243),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 35,
                        color: Color.fromARGB(255, 36, 145, 200),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          commantextinputfeild(
                            label: "Email",
                            hintText: "Enter Email",
                            controller: emailcontroller,
                            validateFunction: (value) {
                              if (value == null || value.isEmpty) {
                                return "please enter Email";
                              }
                              final emailRegex = RegExp(
                                  r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$');

                              if (!emailRegex.hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            prefixIcon: Icon(Icons.email),
                            borderradius: 20,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          commantextinputfeild(
                              borderradius: 20,
                              obscureText: _isObscure,
                              label: "Enter Password",
                              hintText: "Enter Your Password",
                              prefixIcon: Icon(Icons.password),
                              validateFunction: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Password";
                                }
                                if (value.length < 8) {
                                  return "Enter at least 8 character";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(r"\s")),
                              ],
                              suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Builder(
                              builder: (context) => TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => forget()));
                                    },
                                    child: const Text('forget password'),
                                  )),
                          Builder(
                              builder: (context) => TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Signup()));
                                    },
                                    child: const Text('Create an Account'),
                                  )),
                          commonButton(
                            text: "Login",
                            onPressed: () {
                              _login();
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          commonButton(
                            text: "Back",
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
