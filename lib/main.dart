import 'package:demo2/CommanWigets/commanButton.dart';
import 'package:demo2/login.dart';
import 'package:demo2/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Start());
}

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Welcome to the App',
          ),
          backgroundColor: const Color.fromARGB(255, 47, 175, 243),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/1638778843202.jpeg',
                  width: 200,
                  height: 100,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Welcome to the Expertinasia',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      decoration: TextDecoration.underline,
                      color: Color.fromARGB(255, 10, 115, 213),
                      fontWeight: FontWeight.bold),
                ),
                Column(children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Builder(
                      builder: (context) =>
                          // MaterialButton(
                          //   child: Text('Login'),
                          //   color: Color.fromARGB(255, 36, 145, 200),
                          //   textColor: Colors.white,
                          //   height: 60,
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(20),
                          //   ),
                          //   onPressed: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(builder: (context) => Login()),
                          //     );
                          //   },
                          // ),
                          CommonButton(
                            text: "Login",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                              );
                            },
                          )),
                  const SizedBox(
                    height: 40,
                  ),
                  Builder(
                      builder: (context) =>
                          // MaterialButton(
                          //   child: Text('Signup'),
                          //   color: Color.fromARGB(255, 36, 145, 200),
                          //   textColor: Colors.white,
                          //   height: 60,
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(20),
                          //   ),
                          //   onPressed: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(builder: (context) => Signup()),
                          //     );
                          //   },
                          // ),
                          CommonButton(
                            text: "Signup",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Signup()),
                              );
                            },
                          )),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
