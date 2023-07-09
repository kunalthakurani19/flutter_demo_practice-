import 'package:demo2/CommanWigets/commanButton.dart';
import 'package:demo2/CommanWigets/commanTextfeild.dart';
import 'package:demo2/home.dart';
import 'package:flutter/material.dart';

class Forget extends StatefulWidget {
  const Forget({super.key});

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  final TextEditingController mycontroller = TextEditingController();
  void navigateToNextPage(BuildContext context, String data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Home(data: data),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Forget PassWord Page'),
          backgroundColor: const Color.fromARGB(255, 47, 175, 243),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Forget Password',
                  style: TextStyle(
                      fontSize: 23,
                      color: Color.fromARGB(255, 36, 145, 200),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                Commantextinputfeild(
                  controller: mycontroller,
                  borderradius: 20,
                  borderColor: Colors.blue,
                  hintColor: Colors.grey,
                  hintText: "Enter the Email",
                  label: "Enter Email",
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
                ),
                const SizedBox(height: 50),
                CommonButton(
                  text: "Send",
                  onPressed: () {
                    navigateToNextPage(context, mycontroller.text);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
