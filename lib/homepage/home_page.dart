// Importing the Pakages
import 'package:covid19/statetablepage/statetable_page.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url = 'https://api.covidindiatracker.com/total.json';

  int confirmed;
  int active;
  int death;
  int recovered;

  // This Function will make request from the url and fetch data decode it and store in variable

  void makeRequest() async {
    var response = await http.get(url);

    setState(() {
      if (response.statusCode == 200) {
        var extractdata = json.decode(response.body);
        active = extractdata["active"];
        confirmed = extractdata["confirmed"];
        recovered = extractdata["recovered"];
        death = extractdata["deaths"];
      } else {
        throw ErrorDescription("Something went Wrong ...");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.black54,
        elevation: 0.0,
        title: new Text(
          "Covid 19",
          style: TextStyle(
            letterSpacing: 2.5,
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold,
          ),
          textScaleFactor: 1.5,
        ),
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Container(
                height: 80.0,
                padding: EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  border: Border.all(color: Colors.black38),
                ),
                child: Card(
                  margin: EdgeInsets.all(0.0),
                  semanticContainer: false,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  color: Colors.black45,
                  borderOnForeground: true,
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 6,
                                child: Text(
                                  "Confirmed Cases:",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  confirmed.toString().contains('null')
                                      ? "..."
                                      : confirmed.toString(),
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.green,
                                    letterSpacing: 1.0,
                                  ),
                                  textScaleFactor: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Container(
                height: 80.0,
                padding: EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  border: Border.all(color: Colors.black38),
                ),
                child: Card(
                  margin: EdgeInsets.all(0.0),
                  semanticContainer: false,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  color: Colors.black45,
                  borderOnForeground: false,
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 6,
                                child: Text(
                                  "Active Cases:",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  active.toString().contains('null')
                                      ? "..."
                                      : active.toString(),
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.red,
                                    letterSpacing: 1.0,
                                  ),
                                  textScaleFactor: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Container(
                height: 80.0,
                padding: EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  border: Border.all(color: Colors.black38),
                ),
                child: Card(
                  margin: EdgeInsets.all(0.0),
                  semanticContainer: false,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  color: Colors.black45,
                  borderOnForeground: false,
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 6,
                                child: Text(
                                  "Total Recovered:",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange[400],
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  recovered.toString().contains('null')
                                      ? "..."
                                      : recovered.toString(),
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.orange[400],
                                    letterSpacing: 1.0,
                                  ),
                                  textScaleFactor: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Container(
                height: 80.0,
                padding: EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  border: Border.all(color: Colors.black38),
                ),
                child: Card(
                  margin: EdgeInsets.all(0.0),
                  semanticContainer: false,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  color: Colors.black45,
                  borderOnForeground: false,
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 6,
                                child: Text(
                                  "Total Deaths:",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  death.toString().contains('null')
                                      ? "..."
                                      : death.toString(),
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.grey,
                                    letterSpacing: 1.0,
                                  ),
                                  textScaleFactor: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0.0,
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Container(
                height: 80.0,
                padding: EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  margin: EdgeInsets.all(0.0),
                  semanticContainer: true,
                  elevation: 3,
                  borderOnForeground: false,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StateTablePage()),
                      );
                    },
                    color: Colors.black54,
                    disabledTextColor: Colors.white,
                    splashColor: Colors.black12,
                    child: Container(
                      height: 60.0,
                      alignment: Alignment.center,
                      child: Text(
                        "State Details",
                        style: TextStyle(
                          fontSize: 16.0,
                          letterSpacing: 1.5,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                        textScaleFactor: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "COVID 19",
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "PREVENTION",
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: 150.0,
                      height: 150.0,
                      child: Image.asset('images/stayhome.png'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "STAY HOME",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: 150.0,
                      height: 150.0,
                      child: Image.asset('images/washhand.png'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "WASH HAND FREQUENTLY",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: 150.0,
                      height: 150.0,
                      child: Image.asset('images/wearmask.png'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "WEAR MASK WHEN OUTSIDE",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: 150.0,
                      height: 150.0,
                      child: Image.asset('images/socialgathering.png'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "AVOID SOCIAL GATHERING",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

// API for Fetching the Time Series Data of Covid-19
// String url2 = 'https://api.covid19india.org/data.json';
//   var result2;
//   var result2final;
//   void makeRequestForChart() async {
//     var response2 = await http.get(url2);
//     setState(
//       () {
//         if (response2.statusCode == 200) {
//           result2 = json.decode(response2.body);
//           result2final = result2['cases_time_series'];
//         } else {
//           print("Connection not established");
//           // throw ErrorDescription("Something went Wrong ...");
//         }
//       },
//     );
//   }
