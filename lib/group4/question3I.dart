import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:test123/group4/question4I.dart';

import '../groups.dart';

class threeI extends StatefulWidget {
  late int c;

  threeI({required this.c});

  @override
  _threeIState createState() => _threeIState();
}

class _threeIState extends State<threeI> {
  int selectedRadio = -1;
  Color color0 = Colors.white;
  Color color1 = Colors.white;
  Color color2 = Colors.white;
  Color color3 = Colors.white;
  String see = 'Check';
  final CustomTimerController _controller = new CustomTimerController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => back(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('Question3'),
          ),
          body: Column(
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
                          return fourI(c: widget.c);
                        }));
                      });
                    }
                    return Text(
                      "${remaining.seconds}",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ),
              Center(
                child: Text(
                  '(3) Who was the first Caliph after the death of Prophet Muhammad (PBUH)?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              RadioListTile<int>(
                  tileColor: color0,
                  activeColor: Colors.black,
                  value: 0,
                  groupValue: selectedRadio,
                  title: Text(
                    'Abu Bakr (May Allah be pleased with him)',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
                    'Ali Bin Abu Talib (May Allah be pleased with him)',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
                    'Uthman Bin Affan (May Allah be pleased with him)',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  onChanged: (value) => setState(() {
                        selectedRadio = value!;
                      })),
              RadioListTile<int>(
                  tileColor: color3,
                  activeColor: Colors.black,
                  value: 3,
                  groupValue: selectedRadio,
                  title: Text(
                    'Umar Bin Al-Khattab (May Allah be pleased with him)',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  onChanged: (value) => setState(() {
                        selectedRadio = value!;
                      })),
              Flexible(
                  flex: 2,
                  child: SizedBox(
                    height: 370,
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    _controller.pause();
                    if (color0 == Colors.green) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return fourI(c: widget.c);
                      }));
                    }
                    if (selectedRadio == 0 && see != 'Next') {
                      setState(() {
                        color0 = Colors.green;
                        see = 'Next';
                        widget.c++;
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
                    } else if (selectedRadio == 3) {
                      setState(() {
                        color3 = Colors.red;
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
          ),
        ),
      ),
    );
  }

  Future<bool> back() {
    _controller.pause();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return group();
    }));
    return Future.value(true);
  }
}
