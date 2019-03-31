import 'package:flutter/material.dart';
import 'package:flutter_product/pages/post/post_detail.dart';
import 'package:flutter_product/widgets/carousel.dart';

class HomeSliderWidget extends StatelessWidget {
  final List<Map<String, dynamic>> images;
  HomeSliderWidget({@required this.images});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 180.0,
          width: double.infinity,
          child: CustomCarousel(
            imageBuilder: _imageBuilder(images),
            imageCount: images.length,
            dotSize: 4.0,
            dotSpacing: 15.0,
            dotColor: Colors.white,
            indicatorBgPadding: 5.0,
            dotBgColor: Colors.black.withOpacity(0.2),
            // moveIndicatorFromBottom: 180.0,
            autoplay: true,
            autoplayDuration: const Duration(seconds: 6),
          ),
        ),
      ],
    );
  }

  _imageBuilder(List images) {
    return images
        .map((obj) => ImageBuilder(
              imageType: 'networkImage',
              boxFit: BoxFit.cover,
              imageUrl: obj["url"],
              imageCaption: obj["title"],
              overlayShadow: true,
              callback: () => null,
            ))
        .toList();
  }
}
