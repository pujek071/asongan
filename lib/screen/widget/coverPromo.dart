import 'package:casestoreapp/network/apiurl.dart';
import 'package:casestoreapp/model/promoModel.dart';
import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:carousel_pro/carousel_pro.dart';



class PromoCover extends StatefulWidget {
  @override
  _PromoCoverState createState() => _PromoCoverState();
}

class _PromoCoverState extends State<PromoCover> {
  ApiUrl apiUrl;
  @override
  void initState() {
    super.initState();
    apiUrl = ApiUrl();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: apiUrl.getPromo(),
        builder:
            (BuildContext context, AsyncSnapshot<List<PromoModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<PromoModel> profiles = snapshot.data;
            return _buildListView(profiles);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildListView(List<PromoModel> profiles) {
    return Container(
        child: Container(
      child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: profiles.length,
          itemBuilder: (context, index) {
            PromoModel profile = profiles[index];
            return Container(
              child: SizedBox(
                width: double.infinity,
                height: 190,
                child: Carousel(
                  autoplay: true,
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: Duration(milliseconds: 1000),
                  dotSize: 4.0,
                  dotIncreasedColor: Color(0xFFFF335C),
                  dotBgColor: Colors.transparent,
                  dotPosition: DotPosition.bottomCenter,
                  dotVerticalPadding: 10.0,
                  showIndicator: true,
                  indicatorBgPadding: 5.0,
                  images: [
                    ExtendedImage.network("${profile.urlimg}", fit: BoxFit.fill,),
                    ExtendedImage.network("${profile.urlimg2}",fit: BoxFit.fill),
                    ExtendedImage.network("${profile.urlimg3}", fit: BoxFit.fill),
                    ExtendedImage.network("${profile.urlimg4}", fit: BoxFit.fill),                  
                  ],
                  
                ),
              ),
            );
          }
          // child: CarouselSlider(
          //   autoPlay: true,
          //   height: 200.0,
          //   items: profiles.profileFromJson((i){
          //     return
          //   }),
          // ),
          ),
    ));
  }
}
