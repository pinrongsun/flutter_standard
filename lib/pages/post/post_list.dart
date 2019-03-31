import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_product/pages/post/post_detail.dart';
import 'package:flutter_product/utils/constants.dart';
import 'package:flutter_product/utils/icon_font.dart';
import 'package:flutter_product/widgets/appbar.dart';
import 'package:flutter_product/widgets/card.dart';

class PostListPage extends StatefulWidget {
  final List data;
  final String title;
  PostListPage({@required this.data, this.title});

  @override
  _PostListPageState createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppBar(
            icon: FeatherIcons.arrow_left,
            title: widget.title,
            onPress: () => Navigator.pop(context),
          ),
          Expanded(child: _buildList(context))
        ],
      ),
    );
  }

  void onCardPress(context, currentData) {
    Navigator.push(
      context,
      MaterialPageRoute<String>(
          builder: (BuildContext context) => PostDetailPage(data: currentData)),
    );
  }

  ListView _buildList(context) {
    return ListView.builder(
      itemCount: widget.data.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: CustomCard(
            onPress: () => onCardPress(context, widget.data[index]),
            left: Container(
              width: 70,
              height: 50,
              child: Hero(
                tag: widget.data[index]["title"],
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image(
                    fit: BoxFit.cover,
                    image:
                        CachedNetworkImageProvider(widget.data[index]["image"]),
                  ),
                ),
              ),
            ),
            content: Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  widget.data[index]["title"],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: Constants.fontSizes.body2),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
