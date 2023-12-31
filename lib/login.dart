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
      navigateTotheNextPage(context, emailcontroller.text);
    } else {}
  }

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('Welcome to Login Screen'),
          backgroundColor: const Color.fromARGB(255, 47, 175, 243),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 35,
                        color: Color.fromARGB(255, 36, 145, 200),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Commantextinputfeild(
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
                            prefixIcon: const Icon(Icons.email),
                            borderradius: 20,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Commantextinputfeild(
                              borderradius: 20,
                              obscureText: _isObscure,
                              label: "Enter Password",
                              hintText: "Enter Your Password",
                              prefixIcon: const Icon(Icons.password),
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
                          const SizedBox(
                            height: 10,
                          ),
                          Builder(
                              builder: (context) => TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Forget()));
                                    },
                                    child: const Text('forget password'),
                                  )),
                          Builder(
                              builder: (context) => TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Signup()));
                                    },
                                    child: const Text('Create an Account'),
                                  )),
                          CommonButton(
                            text: "Login",
                            onPressed: () {
                              _login();
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CommonButton(
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
