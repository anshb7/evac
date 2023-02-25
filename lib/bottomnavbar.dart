import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class bottomnavbar extends StatefulWidget {
  const bottomnavbar({super.key});

  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  int ind = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                icon: Icons.done_outline_rounded,
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
    );
  }
}
