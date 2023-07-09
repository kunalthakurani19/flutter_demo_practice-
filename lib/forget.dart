import 'package:demo2/CommanWigets/commanButton.dart';
import 'package:demo2/CommanWigets/commanTextfeild.dart';
import 'package:demo2/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class forget extends StatefulWidget {
  const forget({super.key});

  @override
  State<forget> createState() => _forgetState();
}

class _forgetState extends State<forget> {
  @override
  final TextEditingController mycontroller = TextEditingController();
  void navigateToNextPage(BuildContext context, String data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => home(data: data),
      ),
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Forget PassWord Page'),
          backgroundColor: Color.fromARGB(255, 47, 175, 243),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Forget Password',
                    style: TextStyle(
                        fontSize: 23,
                        color: Color.fromARGB(255, 36, 145, 200),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 50),
                  commantextinputfeild(
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
                  SizedBox(height: 50),
                  commonButton(
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
      ),
    );
  }
}
