import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_product/utils/constants.dart';
import 'package:flutter_product/utils/icon_font.dart';
import 'package:flutter_product/widgets/appbar.dart';

class PostDetailPage extends StatefulWidget {
  final Map data;
  PostDetailPage({@required this.data});
  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  ScrollController _controller;
  double offset = 0.0;
  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  _scrollListener() {
    setState(() {
      offset = _controller.offset;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            expandedHeight: 230.0,
            floating: false,
            pinned: true,
            leading: IconButton(
              icon: Icon(
                FeatherIcons.arrow_left,
                color: offset < 132 ? Colors.white : Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.data["title"],
                style: TextStyle(
                    color: offset < 132 ? Colors.white : Colors.black),
              ),
              background: Hero(
                tag: widget.data["title"],
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(widget.data["image"]),
                    ),
                    Container(
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
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(widget.data["postedDate"]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20, bottom: 20, right: 40),
                  child: SizedBox(
                    child: Text(
                        widget.data["content"],
                        style: TextStyle(fontSize: Constants.fontSizes.body2),
                      ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

//

//
