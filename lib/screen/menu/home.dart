import 'package:casestoreapp/screen/produk/produkCatalog.dart';
import 'package:casestoreapp/screen/widget/categori.dart';
import 'package:casestoreapp/screen/widget/coverPromo.dart';
import 'package:casestoreapp/screen/widget/credit.dart';
import 'package:casestoreapp/screen/widget/recomProduk.dart';
// import 'package:casestoreapp/screen/widget/recomProduk.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(height: 90, child: Credit()),
            Container(
                height: 200, child: Card(elevation: 5, child: PromoCover())),
            Container(
                height: 132,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: ListTile(
                        title: Text(
                          'Kategori Asongan',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              fontStyle: FontStyle.italic),
                        ),
                        subtitle: Text("Barbagai Macam Produk Asongan"),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 20.0,
                            color: Colors.blueAccent,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Categoris(),
                  ],
                )),
            Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Recomendasi Produk',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic),
                    ),
                    subtitle: Text("Produk Terbaik untuk Anda"),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 20.0,
                        color: Colors.blueAccent,
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=> ProdukCatalog(),
                        ));
                      },
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 5),
                      height: 230,
                      width: double.infinity,
                      child: RecomProduk()),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
