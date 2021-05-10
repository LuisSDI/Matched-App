import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';
import 'page_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class ImageSlider extends StatefulWidget {
  List<String> imgList;

  ImageSlider({ Key key, @required this.imgList});
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return Stack(children: [
      Container(
        color: black,
        child: CarouselSlider(
          items: widget.imgList
              .map((item) => Container(

                    child: Image(
                      image: AssetImage(item),
                      fit: BoxFit.cover,
                      //width: scaler.getWidth(110),
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
              height: scaler.getHeight(32),
              autoPlay: true,
              enlargeCenterPage: false,
              enableInfiniteScroll: true,
              //aspectRatio: ,
              //enlargeStrategy: CenterPageEnlargeStrategy.height,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
      ),
      Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          
          child: Padding(
            padding: EdgeInsets.only(bottom: scaler.getHeight(1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i = 0; i < widget.imgList.length; i++)
                  _current == i
                      ? pageIndexIndicator(true)
                      : pageIndexIndicator(false)
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}

Widget pageIndexIndicator(bool isCurrentPage) {
  ScreenScaler scaler = ScreenScaler();

  return Container(
    margin: EdgeInsets.symmetric(horizontal: scaler.getWidth(.1)),
    height: scaler.getWidth(.35),
    width: scaler.getWidth(.35),
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCurrentPage ? mainColor : greyish),
  );
}
