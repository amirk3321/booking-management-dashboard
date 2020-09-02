import 'package:booking_management_dashboard/repository/fake_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BodyContentWidget extends StatefulWidget {
  final SizingInformation sizingInformation;

  const BodyContentWidget({Key key, this.sizingInformation}) : super(key: key);

  @override
  _BodyContentWidgetState createState() => _BodyContentWidgetState();
}

class _BodyContentWidgetState extends State<BodyContentWidget> {
  int _rowCurrentBtnIndex = 0;
  final _data = FakeRepository.data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.sizingInformation.screenSize.width / 1.4,
      child: Column(
        children: [
          _headerWidget(),
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
          widget.sizingInformation.screenSize.width / 1.4 <= 860
              ? _row2by2Widget()
              : _row4Widget()
        ],
      ),
    );
  }

  Widget _row4Widget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _singleItemQuickStats(
          title: "Total Bookings",
          value: "28,345",
          icon: null,
        ),
        _singleItemQuickStats(
            title: "Pending Approval",
            value: "180",
            icon: null,
            textColor: Colors.red),
        _singleItemQuickStats(
            title: "New Clients This Month",
            value: "810",
            icon: Icons.arrow_upward,
            iconColor: Colors.green),
        _singleItemQuickStats(
            title: "Returning Clients",
            value: "20%",
            icon: Icons.arrow_downward,
            iconColor: Colors.red),
      ],
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
              width: widget.sizingInformation.screenSize.width / 3.1,
              icon: null,
            ),
            _singleItemQuickStats(
                title: "Pending Approval",
                value: "180",
                icon: null,
                width: widget.sizingInformation.screenSize.width / 3.1,
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
                width: widget.sizingInformation.screenSize.width / 3.1),
            _singleItemQuickStats(
                title: "Returning Clients",
                value: "20%",
                icon: Icons.arrow_downward,
                width: widget.sizingInformation.screenSize.width / 3.1,
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
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
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
      ),
    );
  }
}
