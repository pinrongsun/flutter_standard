import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../../models/item_model.dart';
import 'dart:async';
import 'news_source.dart';

final _root = 'https://hacker-news.firebaseio.com/v0';

class HackerNewsApi implements Source {
  Client client = Client();

  Future<List<int>> fetchTopIds() async {
    final response = await client.get('$_root/topstories.json');
    final ids = json.decode(response.body);
    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async {
    final response = await client.get('$_root/item/$id.json');
    final parsedJson = json.decode(response.body);
    return ItemModel.fromJson(parsedJson);
  }
}
