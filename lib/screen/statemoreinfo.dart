// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:covidtracker/notification_service.dart';
import 'package:covidtracker/screen/historicaldataScreen.dart';
import 'package:covidtracker/stateAPI.dart';
import 'package:covidtracker/screen/homescreen.dart';

var pop = t;
var level = t;
var fipsCode = t;

var vaxDataAvailable = true;

var vaxPercent = t;
var vaxTotal = t;
var vaxInitiate = t;

var icuCapacity = t;
var icuAvailable = t;
var icuCovidUse = t;

var caseDensity = t;
var infectionRate = t;
var testPRatio = t;

class StateMoreInfo extends StatefulWidget {
  const StateMoreInfo({Key? key}) : super(key: key);

  @override
  State<StateMoreInfo> createState() => stateMoreInfo();
}

class stateMoreInfo extends State<StateMoreInfo> {
  @override
  void initState() {
    super.initState();
    refreshData();
  }

  refreshPress() {
    setState(() {
      pop = t;
      level = t;
      fipsCode = t;

      vaxPercent = t;
      vaxTotal = t;
      vaxInitiate = t;

      icuCapacity = t;
      icuAvailable = t;
      icuCovidUse = t;

      caseDensity = t;
      testPRatio = t;
      infectionRate = t;

      refreshData();
    });
  }

  refreshData() async {
    http.Response response = await http.get(currentStateAPI);
    setState(() {
      if (response.statusCode == 200) {
        var results = jsonDecode(response.body);
        pop = results['population'].toString();
        level = results['level'].toString();
        fipsCode = results['fips'].toString();

        icuCapacity = results['actuals']['icuBeds']['capacity'].toString();
        icuCovidUse =
            results['actuals']['icuBeds']['currentUsageCovid'].toString();
        icuAvailable = (results['actuals']['icuBeds']['capacity'] -
                results['actuals']['icuBeds']['currentUsageTotal'])
            .toString();

        testPRatio = results['metrics']['testPositivityRatio'].toString();
        caseDensity = results['metrics']['caseDensity'].toString();
        infectionRate = results['metrics']['infectionRate'].toString();

        if (results['actuals']['vaccinationsCompleted'] == null) {
          vaxDataAvailable = false;
        } else {
          vaxDataAvailable = true;
          vaxInitiate = results['actuals']['vaccinationsInitiated'].toString();
          vaxTotal = results['actuals']['vaccinationsCompleted'].toString();
          vaxPercent = ((results['actuals']['vaccinationsCompleted'] /
                          results['population']) *
                      100)
                  .toString() +
              '%';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                                    text: 'More Info For ' + curState,
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
                                              text: 'Basic State Info',
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
                                              text: 'Population: ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily: 'JosefinSans'),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: pop,
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
                                              text: 'Level: ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily: 'JosefinSans'),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: level,
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
                                                    text: 'FIPS Code: ',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontFamily:
                                                            'JosefinSans',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: fipsCode,
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
                                              text: 'Vaccination Info',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 25,
                                                  fontFamily: 'JosefinSans'),
                                            ),
                                          ),
                                        ),
                                      ),
                                      !vaxDataAvailable
                                          ? Padding(
                                              padding: EdgeInsets.all(5),
                                              child: Text(
                                                  'NO DATA AVAILABLE FOR THIS STATE',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 35,
                                                      fontFamily:
                                                          'JosefinSans')))
                                          : Padding(
                                              padding: EdgeInsets.all(5),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text.rich(
                                                  TextSpan(
                                                    text:
                                                        'Fully Vax Population: ',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontFamily:
                                                            'JosefinSans'),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: vaxTotal,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'JosefinSansSB',
                                                              color: Colors
                                                                  .black87)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                      !vaxDataAvailable
                                          ? Container()
                                          : Padding(
                                              padding: EdgeInsets.all(5),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text.rich(
                                                  TextSpan(
                                                    text: 'Vax Percent: ',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontFamily:
                                                            'JosefinSans'),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: vaxPercent,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'JosefinSansSB',
                                                              color: Colors
                                                                  .black87)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                      !vaxDataAvailable
                                          ? Container()
                                          : Padding(
                                              padding: EdgeInsets.all(5),
                                              child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: RichText(
                                                      textAlign: TextAlign.left,
                                                      text: TextSpan(
                                                          text:
                                                              'Vax Initiated: ',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'JosefinSans',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                                text:
                                                                    vaxInitiate,
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
                                              text: 'ICU Beds Status ',
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
                                              text: 'Beds Total: ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily: 'JosefinSans'),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: icuCapacity,
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
                                              text: 'Beds Available: ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily: 'JosefinSans'),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: icuAvailable,
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
                                                    text:
                                                        'Beds Used For Covid: ',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontFamily:
                                                            'JosefinSans',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: icuCovidUse,
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
                                              text: 'Misc ',
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
                                              text: 'Case Density: ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily: 'JosefinSans'),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: caseDensity,
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
                                              text: 'Test Positivity Ratio: ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily: 'JosefinSans'),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: testPRatio,
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
                                                    text: 'Infection Rate: ',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontFamily:
                                                            'JosefinSans',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: infectionRate,
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
                                child: ElevatedButton.icon(
                                    icon: Icon(Icons.refresh),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.blue)),
                                    onPressed: () => refreshPress(),
                                    label: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Text('Refresh Data',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'JosefinSans',
                                                fontSize: 25,
                                                fontWeight:
                                                    FontWeight.bold))))),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 0, left: 20, right: 20, bottom: 200),
                                child: ElevatedButton.icon(
                                    icon: Icon(Icons.arrow_back_rounded),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.blue)),
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen())),
                                    label: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Text('Back',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'JosefinSans',
                                                fontSize: 35,
                                                fontWeight: FontWeight.bold))))),
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
