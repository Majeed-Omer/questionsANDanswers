import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:test123/group1/question3T.dart';

import '../../groups.dart';

class two extends StatefulWidget {
  late int c;

  two({required this.c});

  @override
  _twoState createState() => _twoState();
}

class _twoState extends State<two> {
  int selectedRadio = -1;
  Color color0 = Colors.white;
  Color color1 = Colors.white;
  Color color2 = Colors.white;
  String see = 'Check';
  final CustomTimerController _controller = new CustomTimerController();
  int c = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => back(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text('Question 2'),
              ),
              body: FutureBuilder<User?>(
                future: readUsers(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Something went wrong! ${snapshot}");
                  } else if (snapshot.hasData) {
                    final users = snapshot.data;
                    return users == null
                        ? Center(
                            child: Text("no question"),
                          )
                        : buildUser(users);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )),
        ));
  }

  Future<bool> back() {
    _controller.pause();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return group();
    }));
    return Future.value(true);
  }

  Widget buildUser(User user) => Column(
        children: [
          Center(
            child: CustomTimer(
              from: Duration(seconds: 10),
              to: Duration(seconds: 0),
              controller: _controller,
              onBuildAction: CustomTimerAction.auto_start,
              builder: (CustomTimerRemainingTime remaining) {
                if (remaining.seconds == '00') {
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return three(c: c);
                    }));
                  });
                }
                return Text(
                  "${remaining.seconds}",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                );
              },
            ),
          ),
          Center(
            child: Text(
              user.question,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          RadioListTile<int>(
              tileColor: color0,
              activeColor: Colors.black,
              value: 0,
              groupValue: selectedRadio,
              title: Text(
                user.answer1,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              onChanged: (value) => setState(() {
                    selectedRadio = value!;
                  })),
          RadioListTile<int>(
              tileColor: color1,
              activeColor: Colors.black,
              value: 1,
              groupValue: selectedRadio,
              title: Text(
                user.answer2,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              onChanged: (value) => setState(() {
                    selectedRadio = value!;
                  })),
          RadioListTile<int>(
              tileColor: color2,
              activeColor: Colors.black,
              value: 2,
              groupValue: selectedRadio,
              title: Text(
                user.answer3,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              onChanged: (value) => setState(() {
                    selectedRadio = value!;
                  })),
          Flexible(
            flex: 2,
            child: SizedBox(
              height: 390,
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: () {
                _controller.pause();
                if (color0 == Colors.green) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return three(c: c);
                  }));
                }
                if (selectedRadio == 0 && see != 'Next') {
                  setState(() {
                    color0 = Colors.green;
                    see = 'Next';
                    c++;
                  });
                } else if (selectedRadio == 1) {
                  setState(() {
                    color1 = Colors.red;
                    color0 = Colors.green;
                    see = 'Next';
                  });
                } else if (selectedRadio == 2) {
                  setState(() {
                    color2 = Colors.red;
                    color0 = Colors.green;
                    see = 'Next';
                  });
                } else {
                  setState(() {
                    color0 = Colors.green;
                    see = 'Next';
                  });
                }
              },
              child: Text(see))
        ],
      );

  Future<User?> readUsers() async {
    final docUser =
        FirebaseFirestore.instance.collection('questions').doc('q2');
    final snapShot = await docUser.get();

    if (snapShot.exists) {
      return User.fromJson(snapShot.data()!);
    }
  }
}

class User {
  final String question;
  final String answer1;
  final String answer2;
  final String answer3;

  User(
      {required this.question,
      required this.answer1,
      required this.answer2,
      required this.answer3});

  static User fromJson(Map<String, dynamic> json) => User(
      question: json['question'],
      answer1: json['answer1'],
      answer2: json['answer2'],
      answer3: json['answer3']);
}
