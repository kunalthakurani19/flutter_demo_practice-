import 'package:demo2/CommanWigets/commanButton.dart';
import 'package:demo2/CommanWigets/commanTextfeild.dart';
import 'package:demo2/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Signup extends StatefulWidget {
  const Signup({
    super.key,
  });

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isChecked = false;
  bool isObscure = true;
  bool isObscure1 = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? _selectedGender;
  DateTime? _selectedDate;

  // Radio value change handler
  void _handleGenderChange(String? value) {
    setState(() {
      _selectedGender = value;
    });
  }

  String? validatePasswordMatch(String value, String confirmPassword) {
    if (value != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _signup() {
    // Validate the form fields
    if (!_formKey.currentState!.validate()) {
      navigateToNextPage(context, nameController.text);
    }
    if (!_isChecked) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Logout"),
            content: const Text("Please Agree terms and condition "),
            actions: [
              TextButton(
                child: const Text('ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  void navigateToNextPage(BuildContext context, String data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Profile(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
        ),
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
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('Welcome to Signup Screen'),
          backgroundColor: const Color.fromARGB(255, 47, 175, 243),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'SignUp',
                    style: TextStyle(
                        fontSize: 35,
                        color: Color.fromARGB(255, 10, 115, 213),
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
                          controller: nameController,
                          label: "First Name",
                          hintText: "Enter first Name",
                          prefixIcon: const Icon(Icons.perm_identity),
                          validateFunction: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter First Name";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Commantextinputfeild(
                            controller: emailController,
                            label: "Enter Email",
                            hintText: "Enter Your Email",
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
                            prefixIcon: const Icon(Icons.email)),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: RadioListTile<String>(
                                title: const Text('Male'),
                                value: 'Male',
                                groupValue: _selectedGender,
                                onChanged: _handleGenderChange,
                              ),
                            ),
                            Flexible(
                              child: RadioListTile<String>(
                                title: const Text('Female'),
                                value: 'Female',
                                groupValue: _selectedGender,
                                onChanged: _handleGenderChange,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          readOnly: true,
                          controller: TextEditingController(
                            text: _selectedDate != null
                                ? _selectedDate.toString().split(' ')[0]
                                : '',
                          ),
                          decoration: const InputDecoration(
                            labelText: "Date of Birth",
                            hintText: "Select Date of Birth",
                            prefixIcon: Icon(Icons.calendar_today),
                          ),
                          onTap: () => _selectDate(context),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Commantextinputfeild(
                            controller: phoneController,
                            label: "Enter Phone Numbers",
                            hintText: "Enter Your Phone Number",
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            validateFunction: (value) {
                              if (value == null || value.isEmpty) {
                                return "please enter Phone number";
                              }
                              if (value.length < 10 || value.length > 10) {
                                return "please enter valid phone number";
                              }

                              return null;
                            },
                            prefixIcon: const Icon(Icons.phone)),
                        const SizedBox(
                          height: 30,
                        ),
                        Commantextinputfeild(
                          controller: passwordController,
                          obscureText: isObscure,
                          label: "Password",
                          hintText: "Enter Your Password",
                          prefixIcon: const Icon(Icons.password),
                          validateFunction: (value) {
                            validatePasswordMatch(
                                value, confirmpasswordController.text);
                            if (value == null || value.isEmpty) {
                              return "Please Enter password";
                            }
                            if (value.length < 8) {
                              return "Enter at least 8 character";
                            }
                            return null;
                          },
                          suffixIcon: IconButton(
                              icon: Icon(isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              }),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Commantextinputfeild(
                          controller: confirmpasswordController,
                          obscureText: isObscure1,
                          label: "Confirm Password",
                          hintText: "Enter Your Confirm Password",
                          prefixIcon: const Icon(Icons.password),
                          validateFunction: (value) => validatePasswordMatch(
                              passwordController.text, value),
                          suffixIcon: IconButton(
                              icon: Icon(isObscure1
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  isObscure1 = !isObscure1;
                                });
                              }),
                        ),
                        CheckboxListTile(
                          title: const Text('Agree Terms and Conditions'),
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value ?? true;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Row(
                            children: [
                              CommonButton(
                                text: "SignUp",
                                onPressed: () {
                                  _signup();
                                },
                              ),
                              const SizedBox(
                                width: 90,
                              ),
                              CommonButton(
                                text: "Back",
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
