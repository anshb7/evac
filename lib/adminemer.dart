import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:evac/admin.dart';

class emergencyadmin extends StatefulWidget {
  const emergencyadmin({super.key});

  @override
  State<emergencyadmin> createState() => _emergencyadminState();
}

class _emergencyadminState extends State<emergencyadmin> {
  int selectedIndex = 0;
  var screens = [Admin(), emergencyadmin()];
  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(215, 226, 250, 1),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Declare an',
                style: TextStyle(
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.grey,
                        offset: Offset(2, 2),
                      ),
                      // font size and color of the text
                    ],
                    color: Color.fromRGBO(45, 50, 70, 1),
                    fontSize: 40,
                    fontFamily: "Product",
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'emergency?',
                style: TextStyle(
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.grey,
                        offset: Offset(2, 2),
                      ),
                      // font size and color of the text
                    ],
                    color: Color.fromRGBO(45, 50, 70, 1),
                    fontSize: 40,
                    fontFamily: "Product",
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hold the button to inform everyone!',
                  style: TextStyle(
                      color: Color.fromRGBO(134, 139, 163, 1),
                      fontSize: 15,
                      fontFamily: "Product",
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(15),
                  child: GestureDetector(
                    onTap: () {
                      AlertDialog(
                        title: const Text(
                          'Please hold the button a little longer!',
                          style: TextStyle(fontFamily: "Product"),
                        ),
                      );
                    },
                    onLongPress: () {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                title: const Text(
                                  'SOS Signal Sent!',
                                  style: TextStyle(fontFamily: "Product"),
                                ),
                              ));
                    },
                    child: Container(
                      width: 250.0,
                      height: 250.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/letsgo.png")),
                        borderRadius: BorderRadius.all(Radius.circular(200.0)),
                      ),
                    ),
                  )),
            ]),
      ),
    );
  }
}
