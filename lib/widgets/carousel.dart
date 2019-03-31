import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class CustomCarousel extends StatefulWidget {
  //All the images on this CustomCarousel.
  // All image build on this customCarousel
  final List<Widget> imageBuilder;
  final int imageCount;
  //The transition animation timing curve. Default is [Curves.ease]
  final Curve animationCurve;

  //The transition animation duration. Default is 300ms.
  final Duration animationDuration;

  // The base size of the dots. Default is 8.0
  final double dotSize;

  // The increase in the size of the selected dot. Default is 2.0
  final double dotIncreaseSize;

  // The distance between the center of each dot. Default is 25.0
  final double dotSpacing;

  // The Color of each dot. Default is Colors.white
  final Color dotColor;

  // The background Color of the dots. Default is [Colors.grey[800].withOpacity(0.5)]
  final Color dotBgColor;

  // Enable or Disable the indicator (dots). Default is true
  final bool showIndicator;

  //Padding Size of the background Indicator. Default is 20.0
  final double indicatorBgPadding;

  final bool borderRadius;
  final Radius radius;

  //Move the Indicator From the Bottom
  final double moveIndicatorFromBottom;

  //Remove the radius bottom from the indicator background. Default false
  final bool noRadiusForIndicator;

  //Enable/Disable the auto play of the slider. Default true
  final bool autoplay;

  //Duration of the Auto play slider by seconds. Default 3 seconds
  final Duration autoplayDuration;

  CustomCarousel(
      {this.imageBuilder,
      this.imageCount,
      this.animationCurve = Curves.ease,
      this.animationDuration = const Duration(milliseconds: 300),
      this.dotSize = 8.0,
      this.dotSpacing = 25.0,
      this.dotIncreaseSize = 2.0,
      this.dotColor = Colors.white,
      this.dotBgColor,
      this.showIndicator = true,
      this.indicatorBgPadding = 20.0,
      this.moveIndicatorFromBottom = 0.0,
      this.noRadiusForIndicator = false,
      this.borderRadius = false,
      this.radius,
      this.autoplay = true,
      this.autoplayDuration = const Duration(seconds: 3)})
      : assert(animationCurve != null),
        assert(animationDuration != null),
        assert(dotSize != null),
        assert(dotSpacing != null),
        assert(dotIncreaseSize != null),
        assert(dotColor != null);

  @override
  State createState() => new CustomCarouselState();
}

class CustomCarouselState extends State<CustomCarousel> {
  final _controller = new PageController();

  @override
  void initState() {
    super.initState();
    if (widget.autoplay) {
      new Timer.periodic(widget.autoplayDuration, (_) {
        if (_controller.page.round() == widget.imageCount - 1) {
          _controller.animateToPage(
            0,
            duration: widget.animationDuration,
            curve: widget.animationCurve,
          );
        } else {
          _controller.nextPage(
              duration: widget.animationDuration, curve: widget.animationCurve);
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            child: new PageView(
              physics: new AlwaysScrollableScrollPhysics(),
              controller: _controller,
              children: widget.imageBuilder,
            ),
          ),
          widget.showIndicator
              ? new Positioned(
                  bottom: widget.moveIndicatorFromBottom,
                  left: 0.0,
                  right: 0.0,
                  child: new Container(
                    decoration: new BoxDecoration(
                      color: widget.dotBgColor == null
                          ? Colors.grey[800].withOpacity(0.5)
                          : widget.dotBgColor,
                      borderRadius: widget.borderRadius
                          ? (widget.noRadiusForIndicator
                              ? null
                              : new BorderRadius.only(
                                  bottomLeft: widget.radius != null
                                      ? widget.radius
                                      : new Radius.circular(8.0),
                                  bottomRight: widget.radius != null
                                      ? widget.radius
                                      : new Radius.circular(8.0)))
                          : null,
                    ),
                    padding: new EdgeInsets.all(widget.indicatorBgPadding),
                    child: new Center(
                      child: new DotsIndicator(
                        controller: _controller,
                        itemCount: widget.imageCount,
                        color: widget.dotColor,
                        dotSize: widget.dotSize,
                        dotSpacing: widget.dotSpacing,
                        dotIncreaseSize: widget.dotIncreaseSize,
                        onPageSelected: (int page) {
                          _controller.animateToPage(
                            page,
                            duration: widget.animationDuration,
                            curve: widget.animationCurve,
                          );
                        },
                      ),
                    ),
                  ),
                )
              : new Container(),
        ],
      ),
    );
  }
}

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator(
      {this.controller,
      this.itemCount,
      this.onPageSelected,
      this.color,
      this.dotSize,
      this.dotIncreaseSize,
      this.dotSpacing})
      : super(listenable: controller);

  // The PageController that this DotsIndicator is representing.
  final PageController controller;

  // The number of items managed by the PageController
  final int itemCount;

  // Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  // The color of the dots.
  final Color color;

  // The base size of the dots
  final double dotSize;

  // The increase in the size of the selected dot
  final double dotIncreaseSize;

  // The distance between the center of each dot
  final double dotSpacing;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (dotIncreaseSize - 1.0) * selectedness;
    return new Container(
      width: dotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: dotSize * zoom,
            height: dotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}

class ImageBuilder extends StatefulWidget {
  final VoidCallback callback;
  final bool borderRadius;
  final Radius radius;
  final String imageUrl;
  final String imageCaption;
  final BoxFit boxFit;
  final bool overlayShadow;
  final Color overlayShadowColors;
  final double overlayShadowSize;
  //image type like assets or network
  final String imageType;

  const ImageBuilder({
    Key key,
    this.callback,
    this.borderRadius = false,
    this.radius,
    @required this.imageUrl,
    this.imageType = 'networkImage',
    this.imageCaption,
    @required this.boxFit,
    this.overlayShadow = false,
    this.overlayShadowColors = Colors.black,
    this.overlayShadowSize = 1.0,
  }) : super(key: key);
  @override
  ImageBuilderState createState() {
    return ImageBuilderState();
  }
}

class ImageBuilderState extends State<ImageBuilder> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.callback,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: widget.borderRadius
                ? BorderRadius.all(widget.radius != null
                    ? widget.radius
                    : Radius.circular(8.0))
                : null,
            image: DecorationImage(
              //colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
              image: widget.imageType == 'networkImage'
                  ? CachedNetworkImageProvider(widget.imageUrl)
                  : AssetImage(widget.imageUrl),
              fit: widget.boxFit,
            )),
        child: widget.overlayShadow
            ? Container(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Text(
                      widget.imageCaption,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    stops: [0.0, widget.overlayShadowSize],
                    colors: [
                      widget.overlayShadowColors != null
                          ? widget.overlayShadowColors.withOpacity(1.0)
                          : Colors.grey[800].withOpacity(1.0),
                      widget.overlayShadowColors != null
                          ? widget.overlayShadowColors.withOpacity(0.0)
                          : Colors.grey[800].withOpacity(0.0)
                    ],
                  ),
                ),
              )
            : Container(),
      ),
    );
  }
}
