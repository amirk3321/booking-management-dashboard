import 'package:booking_management_dashboard/repository/fake_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BodyContentTabletWidget extends StatefulWidget {
  final SizingInformation sizingInformation;

  const BodyContentTabletWidget({Key key, this.sizingInformation}) : super(key: key);

  @override
  _BodyContentTabletWidgetState createState() => _BodyContentTabletWidgetState();
}

class _BodyContentTabletWidgetState extends State<BodyContentTabletWidget> {
  int _rowCurrentBtnIndex = 0;
  final _data = FakeRepository.data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.sizingInformation.screenSize.width / 1.4,
      child: Column(
        children: [
          _headerWidget(),
          _profileWidget(),
          _quickStatsWidget(),
          _rowButtons(),
          SizedBox(
            height: 5,
          ),
          _gridListItems(),
        ],
      ),
    );
  }

  Widget _headerWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "DashBoard",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Text(
              "Customise Blocks",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _quickStatsWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quick Stats",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
         _row2by2Widget()

        ],
      ),
    );
  }


  Widget _row2by2Widget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _singleItemQuickStats(
              title: "Total Bookings",
              value: "28,345",
              width: widget.sizingInformation.screenSize.width / 2.4,
              icon: null,
            ),
            _singleItemQuickStats(
                title: "Pending Approval",
                value: "180",
                icon: null,
                width: widget.sizingInformation.screenSize.width / 2.4,
                textColor: Colors.red),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _singleItemQuickStats(
                title: "New Clients This Month",
                value: "810",
                icon: Icons.arrow_upward,
                iconColor: Colors.green,
                width: widget.sizingInformation.screenSize.width / 2.4),
            _singleItemQuickStats(
                title: "Returning Clients",
                value: "20%",
                icon: Icons.arrow_downward,
                width: widget.sizingInformation.screenSize.width / 2.4,
                iconColor: Colors.red),
          ],
        ),
      ],
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
            style: TextStyle(color: textColor, fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          icon == null
              ? Text(
                  value,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 28,
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

  Widget _rowButtons() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(top: 15, right: 20, left: 20),
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1, color: Colors.black.withOpacity(.2)))),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _rowCurrentBtnIndex = 0;
              });
            },
            child: _singleRowButton(
              title: "Bookings",
              textColor:
                  _rowCurrentBtnIndex == 0 ? Colors.black : Colors.grey[500],
              borderColor: _rowCurrentBtnIndex == 0
                  ? Colors.deepOrange
                  : Colors.transparent,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _rowCurrentBtnIndex = 1;
              });
            },
            child: _singleRowButton(
              title: "Enquiries",
              textColor:
                  _rowCurrentBtnIndex == 1 ? Colors.black : Colors.grey[500],
              borderColor: _rowCurrentBtnIndex == 1
                  ? Colors.deepOrange
                  : Colors.transparent,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _rowCurrentBtnIndex = 2;
              });
            },
            child: _singleRowButton(
              title: "My Service",
              textColor:
                  _rowCurrentBtnIndex == 2 ? Colors.black : Colors.grey[500],
              borderColor: _rowCurrentBtnIndex == 2
                  ? Colors.deepOrange
                  : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _singleRowButton({
    String title,
    Color textColor,
    Color borderColor,
  }) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 2, color: borderColor))),
      child: Text(
        title,
        style: TextStyle(color: textColor, fontSize: 20),
      ),
    );
  }

  Widget _gridListItems() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                widget.sizingInformation.screenSize.width / 1.4 <= 860
                    ? 2
                    : 3,
            childAspectRatio: 1.7),
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
                          fontSize: 18,
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
                        fontSize: 16,
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
                                color: Colors.grey[600], fontSize: 14)),
                        Text(
                          _data[index].date,
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Time",
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 14)),
                        Text(
                          _data[index].time,
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Accept Booking",
                      style: TextStyle(fontSize: 18, color: Colors.indigo),
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

  Widget _profileWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      "Amir Khan!",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      "Lorem Ipsum is simply dummy text.",
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
              Container(
                width: 80,
                height: 80,
                child: Image.asset("assets/profile.png"),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: widget.sizingInformation.screenSize.width/1.5,
                height: 35,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Url",
                    hintStyle: TextStyle(fontSize: 16),
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.copy,
                      size: 18,
                    ),
                  ),
                ),
              ),
              Container(
                height: 35,
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Text(
                  "Edit Link",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          _upgradeToProWidget(),
          _reminderWidget(),
          SizedBox(height: 10,),
        ],
      ),
    );
  }

  Widget _upgradeToProWidget() {
    return Container(
      margin: EdgeInsets.only(top: 40),
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
  Widget _reminderWidget() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Reminders",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Text(
                    "View All",
                    style: TextStyle(color: Colors.orange),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.orange,
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 15,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _singleButton(
                    title: "Booking Reminder",
                    description: "Lorem Ipsum is simply dummy text",
                    icon: Icons.announcement_outlined,
                    iconColor: Colors.red[600],
                    boxColor: Colors.red[100]
                ),
                SizedBox(height: 15),
                _singleButton(
                    title: "New Message",
                    description: "Lorem Ipsum is simply dummy text",
                    icon: Icons.announcement_outlined,
                    iconColor: Colors.yellow[600],
                    boxColor: Colors.yellow[100]
                ),
                SizedBox(height: 15,),
                _singleButton(
                    title: "Upcoming Booking",
                    description: "Lorem Ipsum is simply dummy text",
                    icon: Icons.announcement_outlined,
                    iconColor: Colors.red[600],
                    boxColor: Colors.red[100]
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  _singleButton(
      {Color boxColor,
        Color iconColor,
        IconData icon,
        String title,
        String description}) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Icon(
              icon,
              size: 20,
              color: iconColor,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(description,style: TextStyle(fontSize: 14,color: Colors.grey[400]),)
            ],
          )
        ],
      ),
    );
  }
}
