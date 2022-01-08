// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:covidtracker/notification_service.dart';
import 'package:covidtracker/screen/historicaldataScreen.dart';

var newConfirmed = -1;
var newDeaths;
var dateRecorded;
var dataStringNC = t;
var dataStringD = t;
var dataStringDate = t;

var uaeAPI = Uri.parse('https://corona-api.com/countries/AE');
var usAPI = Uri.parse('https://corona-api.com/countries/US');
var pkAPI = Uri.parse('https://corona-api.com/countries/PK');
var cnAPI = Uri.parse('https://corona-api.com/countries/CN');

var currentAPI = uaeAPI;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    refreshData();
  }

  curImg() {
    if (currentAPI == usAPI)
      return 'assets/usMap.png';
    else if (currentAPI == uaeAPI)
      return 'assets/uaeMap.png';
    else if (currentAPI == pkAPI)
      return 'assets/pakMap.png';
    else if (currentAPI == cnAPI) return 'assets/chinaMap.png';
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

  changeCountry(var api) {
    setState(() {
      currentAPI = api;

      dataStringD = t;
      dataStringNC = t;
      dataStringDate = t;
      refreshData();
    });
  }

  refreshData() async {
    http.Response response = await http.get(currentAPI);
    setState(() {
      if (response.statusCode == 200) {
        var results = jsonDecode(response.body);
        newConfirmed = results['data']['timeline'][0]['new_confirmed'];
        newDeaths = results['data']['timeline'][0]['new_deaths'];
        dateRecorded = results['data']['timeline'][0]['date'];
        dataStringNC = newConfirmed.toString();
        dataStringD = newDeaths.toString();
        dataStringDate = dateRecorded;
        print(newConfirmed);
      }
    });
    NotificationService _notificationService = NotificationService();
    await _notificationService.scheduleNotifications();
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
                    Image.asset(curImg()),
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
                                    text: curLabel(),
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
                                              text: 'Latest Data',
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
                                                    text: dataStringDate,
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
                                                    text: dataStringNC,
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
                                                          text: dataStringD,
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
                                                HistoricalData())),
                                    child: Text('Historical Data ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'JosefinSans',
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold))))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 20, left: 20, right: 20, bottom: 20),
                      child: Row(children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 20, bottom: 20, right: 20),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all<Size>(
                                      Size(
                                          (MediaQuery.of(context).size.width) /
                                              3,
                                          50)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          (currentAPI == usAPI)
                                              ? Colors.blue
                                              : Colors.white)),
                              onPressed: () => changeCountry(usAPI),
                              child: Row(
                                children: [
                                  new Spacer(),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, right: 10),
                                          child: Image.asset(
                                              'assets/favicons/us.png'))),
                                  new Spacer(),
                                ],
                              )),
                        ),
                        new Spacer(),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 20, bottom: 20, right: 20),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all<Size>(
                                      Size(
                                          (MediaQuery.of(context).size.width) /
                                              3,
                                          50)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          (currentAPI == uaeAPI)
                                              ? Colors.blue
                                              : Colors.white)),
                              onPressed: () => changeCountry(uaeAPI),
                              child: Row(
                                children: [
                                  new Spacer(),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, right: 10),
                                          child: Image.asset(
                                              'assets/favicons/uae.png'))),
                                  new Spacer(),
                                ],
                              )),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 20, left: 20, right: 20, bottom: 300),
                      child: Row(children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 20, bottom: 20, right: 20),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all<Size>(
                                      Size(
                                          (MediaQuery.of(context).size.width) /
                                              3,
                                          50)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          (currentAPI == pkAPI)
                                              ? Colors.blue
                                              : Colors.white)),
                              onPressed: () => changeCountry(pkAPI),
                              child: Row(
                                children: [
                                  new Spacer(),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, right: 10),
                                          child: Image.asset(
                                              'assets/favicons/pak.png'))),
                                  new Spacer(),
                                ],
                              )),
                        ),
                        new Spacer(),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 20, bottom: 20, right: 20),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all<Size>(
                                      Size(
                                          (MediaQuery.of(context).size.width) /
                                              3,
                                          50)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          (currentAPI == cnAPI)
                                              ? Colors.blue
                                              : Colors.white)),
                              onPressed: () => changeCountry(cnAPI),
                              child: Row(
                                children: [
                                  new Spacer(),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, right: 10),
                                          child: Image.asset(
                                              'assets/favicons/china.png'))),
                                  new Spacer(),
                                ],
                              )),
                        ),
                      ]),
                    ),
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
