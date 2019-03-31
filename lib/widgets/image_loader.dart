import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_product/utils/constants.dart';

class ImageLoader extends StatelessWidget {
  final double height;
  final String imageUrl;
  ImageLoader({this.height, @required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      // height: height,
      imageUrl: imageUrl,
      placeholder: (context, url) => Placeholder(),
      errorWidget: (context, url, error) => new Icon(Icons.error),
    );
  }
}

class Placeholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 2.0,
    );
  }
}

class ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Constants.images.noImagePlaceholder,
      height: 90.0,
    );
  }
}
