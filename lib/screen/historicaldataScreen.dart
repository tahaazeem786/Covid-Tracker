// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:covidtracker/notification_service.dart';
import 'package:covidtracker/screen/homescreen.dart';

var confirmed1;
var confirmed2;
var confirmed3;
var confirmed4;
var deaths1;
var deaths2;
var deaths3;
var deaths4;

var t = 'LOADING...';
var dataStringC1 = t;
var dataStringC2 = t;
var dataStringC3 = t;
var dataStringC4 = t;
var dataStringD1 = t;
var dataStringD2 = t;
var dataStringD3 = t;
var dataStringD4 = t;
var date1 = t;
var date2 = t;
var date3 = t;
var date4 = t;

class HistoricalData extends StatefulWidget {
  const HistoricalData({Key? key}) : super(key: key);

  @override
  State<HistoricalData> createState() => HistoricalDataState();
}

class HistoricalDataState extends State<HistoricalData> {
  @override
  void initState() {
    super.initState();
    refreshData();
  }

  curLabel() {
    if (currentAPI == usAPI)
      return 'The United States';
    else if (currentAPI == uaeAPI)
      return 'The UAE';
    else if (currentAPI == pkAPI)
      return 'Pakistan';
    else if (currentAPI == cnAPI) return 'China';
  }

  refreshData() async {
    http.Response response = await http.get(currentAPI);
    setState(() {
      if (response.statusCode == 200) {
        var results = jsonDecode(response.body);
        confirmed1 = results['data']['timeline'][1]['new_confirmed'];
        confirmed2 = results['data']['timeline'][2]['new_confirmed'];
        confirmed3 = results['data']['timeline'][3]['new_confirmed'];
        confirmed4 = results['data']['timeline'][4]['new_confirmed'];
        deaths1 = results['data']['timeline'][1]['new_deaths'];
        deaths2 = results['data']['timeline'][2]['new_deaths'];
        deaths3 = results['data']['timeline'][3]['new_deaths'];
        deaths4 = results['data']['timeline'][4]['new_deaths'];
        date1 = results['data']['timeline'][1]['date'];
        date2 = results['data']['timeline'][2]['date'];
        date3 = results['data']['timeline'][3]['date'];
        date4 = results['data']['timeline'][4]['date'];
        dataStringC1 = confirmed1.toString();
        dataStringC2 = confirmed2.toString();
        dataStringC3 = confirmed3.toString();
        dataStringC4 = confirmed4.toString();
        dataStringD1 = deaths1.toString();
        dataStringD2 = deaths2.toString();
        dataStringD3 = deaths3.toString();
        dataStringD4 = deaths3.toString();
      }
    });
    NotificationService test = NotificationService();
    //test.showNotifications();
  }

  @override
  Widget build(BuildContextcontext) {
    return ListView(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Material(
            color: Color.fromRGBO(242, 242, 242, 1),
            child: Column(
              children: <Widget>[
                ColumnSuper(
                  innerDistance: -20,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 0, right: 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(242, 242, 242, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 20, left: 20, right: 20),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: 'Historical Data in ' + curLabel(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'JosefinSans',
                                        fontSize: 33,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(20),
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Column(children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text.rich(
                                            TextSpan(
                                              text: 'Yesterdays Data ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 25,
                                                  fontFamily: 'JosefinSans'),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text.rich(
                                            TextSpan(
                                              text: 'Date Updated: ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily: 'JosefinSans'),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: date1,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'JosefinSansSB',
                                                        color: Colors.black87)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text.rich(
                                            TextSpan(
                                              text: 'Cases: ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily: 'JosefinSans'),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: dataStringC1,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'JosefinSansSB',
                                                        color: Colors.black87)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: RichText(
                                                textAlign: TextAlign.left,
                                                text: TextSpan(
                                                    text: 'Deaths: ',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontFamily:
                                                            'JosefinSans',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: dataStringD1,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'JosefinSansSB',
                                                              color: Colors
                                                                  .black87)),
                                                    ]))),
                                      ),
                                    ]))),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Column(children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text.rich(
                                            TextSpan(
                                              text: '2 Days Ago ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 25,
                                                  fontFamily: 'JosefinSans'),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text.rich(
                                            TextSpan(
                                              text: 'Date Updated: ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily: 'JosefinSans'),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: date2,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'JosefinSansSB',
                                                        color: Colors.black87)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text.rich(
                                            TextSpan(
                                              text: 'Cases: ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily: 'JosefinSans'),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: dataStringC2,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'JosefinSansSB',
                                                        color: Colors.black87)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: RichText(
                                                textAlign: TextAlign.left,
                                                text: TextSpan(
                                                    text: 'Deaths: ',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontFamily:
                                                            'JosefinSans',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: dataStringD2,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'JosefinSansSB',
                                                              color: Colors
                                                                  .black87)),
                                                    ]))),
                                      ),
                                    ]))),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Column(children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text.rich(
                                            TextSpan(
                                              text: '3 Days Ago ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 25,
                                                  fontFamily: 'JosefinSans'),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text.rich(
                                            TextSpan(
                                              text: 'Date Updated: ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily: 'JosefinSans'),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: date3,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'JosefinSansSB',
                                                        color: Colors.black87)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text.rich(
                                            TextSpan(
                                              text: 'Cases: ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily: 'JosefinSans'),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: dataStringC3,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'JosefinSansSB',
                                                        color: Colors.black87)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: RichText(
                                                textAlign: TextAlign.left,
                                                text: TextSpan(
                                                    text: 'Deaths: ',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontFamily:
                                                            'JosefinSans',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: dataStringD3,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'JosefinSansSB',
                                                              color: Colors
                                                                  .black87)),
                                                    ]))),
                                      ),
                                    ]))),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Column(children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text.rich(
                                            TextSpan(
                                              text: '4 Days Ago ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 25,
                                                  fontFamily: 'JosefinSans'),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text.rich(
                                            TextSpan(
                                              text: 'Date Updated: ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily: 'JosefinSans'),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: date4,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'JosefinSansSB',
                                                        color: Colors.black87)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text.rich(
                                            TextSpan(
                                              text: 'Cases: ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily: 'JosefinSans'),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: dataStringC4,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'JosefinSansSB',
                                                        color: Colors.black87)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: RichText(
                                                textAlign: TextAlign.left,
                                                text: TextSpan(
                                                    text: 'Deaths: ',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontFamily:
                                                            'JosefinSans',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: dataStringD4,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'JosefinSansSB',
                                                              color: Colors
                                                                  .black87)),
                                                    ]))),
                                      ),
                                    ]))),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white)),
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen())),
                                    child: Text('Back to Latest Data',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'JosefinSans',
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold)))),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white)),
                                    onPressed: () => refreshData(),
                                    child: Text('Refresh Data',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'JosefinSans',
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold))))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
