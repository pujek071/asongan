import 'package:casestoreapp/screen/menu/favorite.dart';
import 'package:casestoreapp/screen/menu/home.dart';
import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedIndex = 0;

  final Home _listHome = Home();
  final Favorite _listFavorite = Favorite();

  Widget _showPage = Home();

  Widget _pageChooser(int page){
    switch(page){
      case 0:
        return _listHome;
        break;
      case 1:
        return _listFavorite;
        break;
      default:
        return Scaffold(
          body: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Container(
                  
                  padding: const EdgeInsets.all(20),
                  height: 100,
                  child: Card(
                      color: Colors.yellowAccent,
                      child: Center(
                          child: Text(
                        "Opppss!! Sorry Page Not Found",
                        style: TextStyle(
                            color: Colors.pinkAccent,
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      )))),
            ),
          ),
        );
    }
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
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.yellow,
          selectedItemBackgroundColor: Colors.green,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (int index) {
          setState(() {
            _showPage = _pageChooser(index);
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'Home',
            
          ),
          FFNavigationBarItem(
            iconData: Icons.favorite,
            label: 'Favorite',
          ),
          FFNavigationBarItem(
            iconData: Icons.restore,
            label: 'Hand Made',
          ),
          FFNavigationBarItem(
            iconData: Icons.repeat,
            label: 'Transaksi',
          ),
          FFNavigationBarItem(
            iconData: Icons.settings,
            label: 'Settings',
          ),
        ],
      ),
      body: Container(
          color: Colors.white,
          child: _showPage,
      )
    );
  }
}