import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_product/pages/post/post_detail.dart';
import 'package:flutter_product/pages/post/post_list.dart';
import 'package:flutter_product/utils/constants.dart';
import 'package:flutter_product/widgets/card.dart';

class FoodAndDrinkWidget extends StatelessWidget {
  final List foodAndDrinks;
  FoodAndDrinkWidget({@required this.foodAndDrinks});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "អាហារ និងភេសជ្ជៈ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              FlatButton(
                onPressed: () => onMoreListPress(context),
                child: Text(
                  "បន្ថែម",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(3),
          height: 190,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) =>
                _itemBuilder(context, index),
            itemCount: foodAndDrinks.length,
          ),
        ),
      ],
    );
  }

  void onMoreListPress(context) {
    Navigator.push(
      context,
      MaterialPageRoute<String>(
        builder: (BuildContext context) => PostListPage(
              data: foodAndDrinks,
              title: "អាហារ និងភេសជ្ជៈ",
            ),
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

  _itemBuilder(context, index) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: CustomCard(
        onPress: () => onCardPress(context, foodAndDrinks[index]),
        border: true,
        elevation: 0,
        content: Container(
          padding: EdgeInsets.only(left: 10),
          width: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                foodAndDrinks[index]["title"],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: Constants.fontSizes.title),
              ),
              Text(
                foodAndDrinks[index]["content"],
                style: TextStyle(fontSize: Constants.fontSizes.body1),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Text(foodAndDrinks[index]["postedDate"],
                  style: TextStyle(fontSize: Constants.fontSizes.caption)),
            ],
          ),
        ),
        left: Container(
          width: 100,
          height: 170,
          child: Hero(
            tag: foodAndDrinks[index]["title"],
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image(
                fit: BoxFit.cover,
                image:
                    CachedNetworkImageProvider(foodAndDrinks[index]["image"]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
