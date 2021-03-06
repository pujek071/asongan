import 'package:casestoreapp/model/produkModel.dart';
import 'package:casestoreapp/network/apiurl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

class ProdukCatalog extends StatefulWidget {
  @override
  _ProdukCatalogState createState() => _ProdukCatalogState();
}

class _ProdukCatalogState extends State<ProdukCatalog> {
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

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  Future<void> onRefresh() async {
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Text("Asongan", style: TextStyle(fontSize: 30,fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),),
        actions: <Widget>[
          IconButton(
            icon: Icon(
            Icons.search,
            size: 25.0,
            color: Colors.black,
            ),
             onPressed: () {
                      
                    },
                  ),
          Stack(children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(right: 5.0, top: 8.0, bottom: 5.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 25.0,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      
                    },
                  ),
                ),

                Positioned(
                  top: 7.0,
                  right: 5.0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1,
                          size: 24.0, color: Colors.redAccent),
                      Positioned(
                        top: 5.0,
                        right: 5.0,
                        child: Text("0", style: TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                ),
              ]),
        ],
      ),
        body: loading
            ? Container(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: onRefresh,
                child: GridView.builder(
                  itemCount: list.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
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
                        margin: EdgeInsets.all(5),
                        elevation: 7,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(
                                child: Image.network(
                                  "${a.urlimg}",
                                  fit: BoxFit.cover,
                                  height: 180,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "${a.nama}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'Rp.' + money.format(int.parse(a.harga)),
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.0,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ));
  }
}
