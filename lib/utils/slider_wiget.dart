import 'package:flutter/material.dart';
import 'package:teraki_app_ui/utils/slider.dart';

class SliderMovie extends StatelessWidget {
  final List mSliderList;
  const SliderMovie({Key? key, required this.mSliderList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width - 36;
    final Size cardSize = Size(width, width / 1.5);
    return SliderWidget(
        autoPlay: true,
        height: cardSize.height,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        items: mSliderList.map((slider) {
          return Builder(builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    slider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          });
        }).toList());
  }
}
