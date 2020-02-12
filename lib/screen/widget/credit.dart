import 'package:flutter/material.dart';

class Credit extends StatefulWidget {
  @override
  _CreditState createState() => _CreditState();
}

class _CreditState extends State<Credit> {
  @override
  Widget build(BuildContext context) {
    return Container(
              padding: EdgeInsets.all(5.0),
              height: 100,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Card(
                      child: Container(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.payment,
                                  color: Colors.blue,
                                  size: 30.0,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(" Rp.3.000.000", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                      Text("Credits: Rp.0"),
                                    ],
                                  ),
                                ),
                                
                              ],
                            ),
                          )),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Container(height: 50, child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.view_carousel,
                                  color: Colors.green,
                                  size: 30.0,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Voucher", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                      Text("You have Voucher: 2 "),
                                    ],
                                  ),
                                ),
                                
                              ],
                            ),
                      )),
                    ),
                  ),
                ],
              ));
  }
}