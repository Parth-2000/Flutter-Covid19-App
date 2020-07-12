// Importing the Pakages
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StateTablePage extends StatefulWidget {
  @override
  _StateTablePageState createState() => _StateTablePageState();
}

class _StateTablePageState extends State<StateTablePage> {
  String url = 'https://api.covidindiatracker.com/state_data.json';
  var result;

  void makeRequest() async {
    var response = await http.get(url);
    setState(
      () {
        if (response.statusCode == 200) {
          result = json.decode(response.body);
        } else {
          throw ErrorDescription("Something went Wrong ...");
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "State Details",
          style: TextStyle(
            color: Colors.deepOrange,
            letterSpacing: 2.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black54,
      ),
      body: Container(
        color: Colors.black,
        child: ListView.builder(
          itemCount: result == null ? 0 : result.length,
          itemBuilder: (BuildContext context, index) {
            if (result[index]['state'] == 'Unknown*') {
              return Text("");
            } else {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0.0),
                    color: Colors.grey[800],
                  ),
                  child: Card(
                    color: Colors.black45,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'State',
                                    style: TextStyle(
                                      color: Colors.deepOrange,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    result[index]['state'].toString(),
                                    style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'Active Cases',
                                    style: TextStyle(
                                      color: Colors.green,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    result[index]['active'].toString(),
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'Confirmed Cases',
                                    style: TextStyle(
                                      color: Colors.red,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    result[index]['confirmed'].toString(),
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'Total Recovered',
                                    style: TextStyle(
                                      color: Colors.orange,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    result[index]['recovered'].toString(),
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'Total Deaths',
                                    style: TextStyle(
                                      color: Colors.yellow,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    result[index]['deaths'].toString(),
                                    style: TextStyle(
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.bold,
                                    ),
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
              );
            }
          },
        ),
      ),
    );
  }
}
