import 'package:casestoreapp/model/produkModel.dart';
import 'package:casestoreapp/network/apiurl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class RecomProduk extends StatefulWidget {
  @override
  _RecomProdukState createState() => _RecomProdukState();
}

class _RecomProdukState extends State<RecomProduk> {
  final money = NumberFormat("#,##0", "en_US");
  var loading = false;
  List<ProdukModel> list = [];
  getProduct() async {
    setState(() {
      loading = true;
    });
    list.clear();
    final response = await http.get(ApiGetProduk.getProduk());
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      setState(() {
        for (Map i in data) {
          list.add(ProdukModel.fromJson(i));
        }
        loading = false;
      });
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  ApiUrl apiUrl;
  @override
  void initState() {
    super.initState();
    apiUrl = ApiUrl();
    getProduct();
  }

  Future<void> onRefresh() async {
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: onRefresh,
                child: Container(
                  width: double.infinity,
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: list.length,
                    itemBuilder: (context, i) {
                      final a = list[i];
                      return InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => ProductDetail(a)));
                          },
                          child: Card(
                            elevation: 6,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              width: 170,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage("${a.urlimg}"))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.only(
                                              topLeft:
                                                  Radius.elliptical(20.0, 20.0),
                                              bottomRight: Radius.elliptical(
                                                  200.0, 200.0))),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0,
                                            left: 5.0,
                                            right: 10,
                                            bottom: 20.0),
                                        child: Text(
                                          'Sale',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 110,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).accentColor,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(45),
                                              topRight: Radius.circular(45))),
                                      width: 150,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 5.0, top: 5.0, left: 12.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text("${a.nama}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 15.0,
                                                    color: Colors.black)),
                                            Text(
                                              'Rp.' +
                                                  money.format(
                                                      int.parse(a.harga)),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15.0,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                    },
                  ),
                ),
              ));
  }
}
