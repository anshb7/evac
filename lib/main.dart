import 'package:evac/bottomnavbar.dart';
import 'package:evac/loginpage.dart';
import 'package:evac/map.dart';
import 'package:evac/otppage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // '/': (context) => MyHomePage(),
        // '/map':(context)=> MapPage()
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: OTPScreen("1"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomnavbar(),
      backgroundColor: Color.fromRGBO(215, 226, 250, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello,Vivaan!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontFamily: "Product",
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Complete Profile",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 10.0,
                    fontFamily: "Product",
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          leading: new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new CircleAvatar(
              backgroundImage: new NetworkImage(
                  "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80"),
            ),
          ),
          actions: <Widget>[
            new IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.pin_drop_rounded,
                  color: Colors.red,
                ))
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Emergency help',
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
              'needed?',
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
                'Hold the button to send a SOS!',
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
                  onLongPress: () {},
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
            SizedBox(
                height: 122,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: 200,
                          width: 125,
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "I have",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontFamily: "Product",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "an injury!",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontFamily: "Product",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: 200,
                          width: 125,
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "I have",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontFamily: "Product",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "an injury!",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontFamily: "Product",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: 200,
                          width: 125,
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "I have",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontFamily: "Product",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "an injury!",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontFamily: "Product",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
