import 'package:booking_management_dashboard/repository/fake_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'widgets/drawer_mobile.dart';

class MobileScreen extends StatelessWidget {
  final _data = FakeRepository.data;
  final scaffoldKey=GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (_,sizingInformation){
        return Scaffold(
          key: scaffoldKey,
          drawer: DrawerMobile(),
          appBar: AppBar(
            leading: GestureDetector(onTap: (){scaffoldKey.currentState.openDrawer();},child: Icon(Icons.menu)),
            title: Text("Dashboard"),
            actions: [
              Icon(Icons.more_vert),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _upgradeToProWidget(),
                _row2by2Widget(sizingInformation),
                _gridListItems()
              ],
            ),
          ),
        );
      },
    );
  }
  Widget _upgradeToProWidget() {
    return Container(
      margin: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          color: Colors.indigo),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upgrade\nto PRO",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "For more Profile Control",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Container(
            height: 50,
            width: 50,
            child: Image.asset("assets/pro.png"),
          )
        ],
      ),
    );
  }
  Widget _gridListItems() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: _data.length,
        physics: ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.85),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 8, top: 8, bottom: 8, left: 4),
            padding: EdgeInsets.symmetric(horizontal: 28, vertical: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  blurRadius: 2,
                  offset: Offset(0.5, 0.5),
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _data[index].serviceName,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "Service",
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    Text(
                      "Flutter Development",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Date",
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 12)),
                        Text(
                          _data[index].date,
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Time",
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 12)),
                        Text(
                          _data[index].time,
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8,),
                    Text(
                      "Accept Booking",
                      style: TextStyle(fontSize: 16, color: Colors.indigo),
                    ),
                    Text("Decline"),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _row2by2Widget(SizingInformation sizingInformation) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _singleItemQuickStats(
                  title: "Total Bookings",
                  value: "28,345",
                  width: sizingInformation.screenSize.width / 2.6,
                  icon: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _singleItemQuickStats(
                    title: "Pending Approval",
                    value: "180",
                    icon: null,
                    width: sizingInformation.screenSize.width / 2.6,
                    textColor: Colors.red),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _singleItemQuickStats(
                    title: "New Clients This Month",
                    value: "810",
                    icon: Icons.arrow_upward,
                    iconColor: Colors.green,
                    width: sizingInformation.screenSize.width / 2.6),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _singleItemQuickStats(
                    title: "Returning Clients",
                    value: "20%",
                    icon: Icons.arrow_downward,
                    width: sizingInformation.screenSize.width / 2.6,
                    iconColor: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _singleItemQuickStats(
      {String title,
        Color textColor = Colors.black,
        String value,
        IconData icon,
        double width,
        Color iconColor}) {
    return Container(
      width: width,
      height: 110,
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.2),
              spreadRadius: 2,
              offset: Offset(0.5, 0.5),
              blurRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(color: textColor, fontSize: 14),
          ),
          SizedBox(
            height: 10,
          ),
          icon == null
              ? Text(
            value,
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                icon,
                color: iconColor,
              )
            ],
          ),
        ],
      ),
    );
  }
}
