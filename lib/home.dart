import 'package:demo2/CommanWigets/commanButton.dart';
import 'package:demo2/CommanWigets/commanTextfeild.dart';
import 'package:demo2/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class home extends StatefulWidget {
  final String data;

  home({required this.data});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<String> items = [];
  TextEditingController textEditingController = TextEditingController();

  void addItemToList() {
    setState(() {
      String newItem = textEditingController.text;
      items.add(newItem);
      textEditingController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ' + widget.data),
        backgroundColor: Color.fromARGB(255, 47, 175, 243),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Text(
                  "Welcome " + widget.data,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 36, 145, 200),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                commantextinputfeild(
                  borderradius: 20,
                  controller: textEditingController,
                  hintText: "Enter Anything You Want",
                  label: "Enter the Text",
                  prefixIcon: Icon(Icons.text_format),
                ),
                SizedBox(height: 20),
                commonButton(
                  text: "Summit",
                  onPressed: addItemToList,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(items[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
