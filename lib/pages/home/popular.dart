import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PopularWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  PopularWidget({@required this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(5),
      elevation: 3,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(imageUrl),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  stops: [0.0, 1.0],
                  colors: [
                    Colors.black.withOpacity(1.0),
                    Colors.black.withOpacity(0.0)
                  ],
                ),
              ),
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}
