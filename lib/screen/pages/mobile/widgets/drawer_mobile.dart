import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.2),
          blurRadius: 2,
          offset: Offset(0.5, 0.0),
          spreadRadius: 2,
        ),
      ]),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            width: 80,
            height: 80,
            child: Image.asset("assets/logo.png"),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 40,
                    height: 40,
                    child: Image.asset("assets/profile.png")),
                Text(
                  "Amir Khan!",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Divider(thickness: 0.50,),
          SizedBox(height: 20,),
          _singleButton(icon: Icons.widgets, title: 'Main'),
          Divider(
            thickness: 0.50,
          ),
          _singleButton(icon: Icons.score, title: "statistic"),
          Divider(
            thickness: 0.50,
          ),
          _singleButton(icon: Icons.calendar_today, title: "Calender"),
          Divider(
            thickness: 0.50,
          ),
          _singleButton(icon: Icons.pages, title: "Pages"),
          Divider(
            thickness: 0.50,
          ),
          _singleButton(icon: Icons.message, title: "Messages"),
          Divider(
            thickness: 0.50,
          ),
          _singleButton(icon: Icons.settings, title: "Settings"),
          Divider(
            thickness: 0.50,
          ),
          _singleButton(icon: Icons.exit_to_app, title: "Exit"),
        ],
      ),
    );
  }

  Widget _singleButton({IconData icon, String title}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [Icon(icon), Text(title)],
      ),
    );
  }
}
