import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'databaseHelper.dart';
import 'groups.dart';

class r extends StatefulWidget {
  late int c;

  r({required this.c});

  @override
  _rState createState() => _rState();
}

class _rState extends State<r> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navi();
  }

  _navi() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => group()));
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => back(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Result'),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Text(
            'The Result: ${widget.c.toString()} / 5',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Future<bool> back() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return group();
    }));
    return Future.value(true);
  }
}
