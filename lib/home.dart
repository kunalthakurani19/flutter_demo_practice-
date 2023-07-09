import 'package:demo2/CommanWigets/commanButton.dart';
import 'package:demo2/CommanWigets/commanTextfeild.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String data;

  const Home({super.key, required this.data});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        title: Text('Welcome ${widget.data}'),
        backgroundColor: const Color.fromARGB(255, 47, 175, 243),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Text(
                  "Welcome ${widget.data}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 36, 145, 200),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Commantextinputfeild(
                  borderradius: 20,
                  controller: textEditingController,
                  hintText: "Enter Anything You Want",
                  label: "Enter the Text",
                  prefixIcon: const Icon(Icons.text_format),
                ),
                const SizedBox(height: 20),
                CommonButton(
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
