import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'group1/question1T.dart';
import 'group2/question1S.dart';
import 'group3/question1H.dart';
import 'group4/question1I.dart';

class group extends StatefulWidget {
  static int x = 0;

  static void getNumber(int? count) {
    x = count!;
  }

  @override
  _groupState createState() => _groupState();
}

class _groupState extends State<group> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool willLeave = false;
        await showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("Are you sure want to exit?"),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          willLeave = true;
                          Navigator.of(context).pop();
                        },
                        child: Text("Yes")),
                    ElevatedButton(
                        onPressed: () {
                          willLeave = false;
                          Navigator.of(context).pop();
                        },
                        child: Text("No")),
                  ],
                ));
        return willLeave;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey[350],
          appBar: AppBar(
            title: Text("Groups"),
            backgroundColor: Colors.black,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 2,
                    child: SizedBox(
                      height: 150.0,
                      width: 150.0,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return one();
                            }));
                          },
                          icon: Column(
                            children: [
                              Text(
                                'Technology',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              Image.asset(
                                'Assets/tech.jpg',
                              ),
                            ],
                          )),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: SizedBox(
                      height: 150.0,
                      width: 150.0,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return oneS();
                            }));
                          },
                          icon: Column(
                            children: [
                              Text(
                                'Sports',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              Image.asset('Assets/sports.jpg'),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 2,
                    child: SizedBox(
                      height: 150.0,
                      width: 150.0,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return oneH();
                            }));
                          },
                          icon: Column(
                            children: [
                              Text(
                                'History',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              Image.asset('Assets/history.jpg'),
                            ],
                          )),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: SizedBox(
                      height: 150.0,
                      width: 150.0,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return oneI();
                            }));
                          },
                          icon: Column(
                            children: [
                              Text(
                                'Islam',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              Image.asset('Assets/islam.jpg'),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    print(group.x);
                  },
                  child: Text("number of wins")),
              ElevatedButton(
                  onPressed: () => FirebaseAuth.instance.signOut(),
                  child: Text("Back")),
              /*ElevatedButton(
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.logout();
                  },
                  child: Text("Back")),*/
            ],
          ),
        ),
      ),
    );
  }
}
