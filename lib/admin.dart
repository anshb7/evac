import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:evac/bottomnavbar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:evac/piedata.dart';
import 'package:evac/bottomnav.dart';
import 'package:evac/bottomnav.dart';
import 'adminemer.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  int ind = 0;
  var screens = [adminpanel(), emergencyadmin()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: 100,
          decoration: BoxDecoration(shape: BoxShape.rectangle),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GNav(
                backgroundColor: Colors.transparent,
                activeColor: Colors.white,
                tabBackgroundColor: Color.fromRGBO(229, 61, 61, 1),
                color: Color.fromRGBO(229, 61, 61, 1),
                tabBorderRadius: 10,
                padding: EdgeInsets.all(16),
                gap: 8,
                onTabChange: (index) {
                  setState(() {
                    ind = index;
                  });
                },
                tabs: [
                  GButton(
                    textStyle: TextStyle(
                        fontFamily: "Product",
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    icon: Icons.home,
                    text: "Home",
                    style: GnavStyle.google,
                  ),
                  GButton(
                    textStyle: TextStyle(
                        fontFamily: "Product",
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    icon: Icons.satellite_alt_sharp,
                    text: "Status",
                    style: GnavStyle.google,
                  ),
                  GButton(
                    textStyle: TextStyle(
                        fontFamily: "Product",
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    icon: Icons.face,
                    text: "Profile",
                    style: GnavStyle.google,
                  )
                ]),
          ),
        ),
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
              // ignore: unnecessary_new
              new IconButton(
                  onPressed: () async {},
                  icon: Icon(
                    Icons.pin_drop_rounded,
                    color: Colors.red,
                  ))
            ],
          ),
        ),
        body: screens[ind]);
  }

  List<_PieData> piedata1() {
    List<_PieData> items = [_PieData("Staff", 26), _PieData("Visitors", 74)];
    return items;
  }
}

class _PieData {
  _PieData(this.xData, this.yData);
  final String xData;
  final num yData;
}

class adminpanel extends StatefulWidget {
  const adminpanel({super.key});

  @override
  State<adminpanel> createState() => _adminpanelState();
}

class _adminpanelState extends State<adminpanel> {
  List<_PieData> piedata = [];
  @override
  void initState() {
    piedata = piedata1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
            height: 370,
            width: 400,
            child: Card(
                elevation: 8,
                color: Color.fromRGBO(242, 244, 255, 1),
                child: Column(
                  children: [
                    SfCircularChart(
                        borderWidth: 1,
                        palette: [Colors.blue, Colors.red],
                        title: ChartTitle(
                            text: ' Total People : 3',
                            textStyle: TextStyle(
                                fontSize: 20,
                                fontFamily: "Product",
                                fontWeight: FontWeight.bold)),
                        legend: Legend(isVisible: true),
                        series: <CircularSeries>[
                          DoughnutSeries<_PieData, String>(
                              explodeIndex: 0,
                              dataSource: piedata,
                              xValueMapper: (_PieData data, _) => data.xData,
                              yValueMapper: (_PieData data, _) => data.yData,
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: false)),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text("24%", style: TextStyle(fontSize: 18)),
                            Container(
                              width: 100,
                              child: LinearProgressIndicator(
                                backgroundColor:
                                    Color.fromRGBO(217, 217, 217, 1),
                                color: Colors.blue,
                                minHeight: 8,
                                value: 0.3,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("76%", style: TextStyle(fontSize: 18)),
                              ],
                            ),
                            Container(
                              width: 100,
                              child: LinearProgressIndicator(
                                backgroundColor:
                                    Color.fromRGBO(217, 217, 217, 1),
                                minHeight: 8,
                                value: 0.7,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ))),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Click to view users list",
            style: TextStyle(
                color: Color.fromRGBO(108, 114, 125, 1),
                fontFamily: "Product",
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 100,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1)),
              onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        title: const Text(
                          'Sent to Authorities!',
                          style: TextStyle(fontFamily: "Product"),
                        ),
                      )),
              child: Text("Send Information to Authorities",
                  style: TextStyle(
                      color: Color.fromRGBO(51, 56, 76, 1),
                      fontFamily: "Product",
                      fontSize: 15,
                      fontWeight: FontWeight.bold))),
        )
      ]),
    );
  }

  List<_PieData> piedata1() {
    List<_PieData> items = [_PieData("Staff", 26), _PieData("Visitors", 74)];
    return items;
  }
}
