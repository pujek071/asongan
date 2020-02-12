import 'package:flutter/material.dart';

class Categoris extends StatefulWidget {
  @override
  _CategorisState createState() => _CategorisState();
}

class _CategorisState extends State<Categoris> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: menuKategoriItem,
      ),
    );
  }
}

List<MenuKategoriItem> menuKategoriItem = [
  MenuKategoriItem(
    title: 'Asongan fashion',
    icon: Icons.supervised_user_circle,
    colorBox: Colors.purple,
    iconColor: Colors.yellowAccent,
  ),
  MenuKategoriItem(
    title: 'Asongan Otomotif',
    icon: Icons.directions_car,
    colorBox: Colors.blueAccent,
    iconColor: Colors.white,
  ),
  MenuKategoriItem(
    title: 'Asongan Elektronik',
    icon: Icons.phone_iphone,
    colorBox: Colors.greenAccent,
    iconColor: Colors.redAccent,
  ),
  MenuKategoriItem(
    title: 'Asongan Mall',
    icon: Icons.store_mall_directory,
    colorBox: Colors.pinkAccent,
    iconColor: Colors.yellowAccent,
  ),
];

class MenuKategoriItem extends StatelessWidget {
  MenuKategoriItem({this.title, this.icon, this.colorBox, this.iconColor});
  final String title;
  final IconData icon;
  final Color colorBox, iconColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => DetailProduk()),
      //   );
      // },
      child: Column(
        children: <Widget>[
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: colorBox,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 10.0),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
