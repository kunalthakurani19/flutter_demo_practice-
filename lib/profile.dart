import 'package:demo2/CommanWigets/commanButton.dart';
import 'package:demo2/home.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class Profile extends StatefulWidget {
  late final String? data;
  String name, email, phone;

  Profile(
      {super.key,
      this.data,
      required this.email,
      required this.name,
      required this.phone});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Page')),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.person,
                          size: 98,
                          color: Color.fromARGB(255, 25, 121, 199),
                        ),
                        Text(
                          "Welcome ${widget.name}",
                          style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 25, 121, 199),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        RowInfo(
                          label: 'Name:',
                          value: widget.name,
                        ),
                        SizedBox(height: 20),
                        RowInfo(
                          label: 'Email:',
                          value: widget.email,
                        ),
                        SizedBox(height: 20),
                        RowInfo(
                          label: 'Phone:',
                          value: widget.phone,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                commonButton(
                  text: "Logout",
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Logout"),
                          content: Text("Are you sure you want to logout?"),
                          actions: [
                            TextButton(
                              child: Text("Cancel"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Logout'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Start(),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RowInfo extends StatelessWidget {
  final String label;
  final String value;

  const RowInfo({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 20),
        Text(
          value,
          style: TextStyle(fontSize: 26),
        ),
      ],
    );
  }
}



// class _ProfileState extends State<Profile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Profile Page')),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 Card(
//                   elevation: 5,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(18.0),
//                     child: Column(
//                       children: [
//                         Icon(
//                           Icons.person,
//                           size: 98,
//                           color: Color.fromARGB(255, 25, 121, 199),
//                         ),
//                         Text(
//                           "Welcome ${widget.name}",
//                           style: TextStyle(
//                             fontSize: 30,
//                             color: Color.fromARGB(255, 25, 121, 199),
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         RowInfo(
//                           label: 'Name:',
//                           value: widget.name,
//                         ),
//                         SizedBox(height: 20),
//                         RowInfo(
//                           label: 'Email:',
//                           value: widget.email,
//                         ),
//                         SizedBox(height: 20),
//                         RowInfo(
//                           label: 'Phone:',
//                           value: widget.phone,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 commonButton(
//                   text: "Logout",
//                   onPressed: () {
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           title: Text("Logout"),
//                           content: Text("Are you sure you want to logout?"),
//                           actions: [
//                             TextButton(
//                               child: Text("Cancel"),
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                             ),
//                             TextButton(
//                               child: Text('Logout'),
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => const Start(),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class RowInfo extends StatelessWidget {
//   final String label;
//   final String value;

//   const RowInfo({
//     required this.label,
//     required this.value,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(
//           label,
//           style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(width: 20),
//         Text(
//           value,
//           style: TextStyle(fontSize: 26),
//         ),
//       ],
//     );
//   }
// }