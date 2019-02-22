import 'dart:async';
import '../resources/news/hacker_news_api.dart';
import '../resources/news/news_db.dart';
import '../resources/news/news_cache.dart';
import '../resources/news/news_source.dart';
import '../models/item_model.dart';

class NewsRepository {
  List<Source> sources = <Source>[
    HackerNewsApi(),
    newsDbProvider,
  ];
  List<Cache> caches = <Cache>[
    newsDbProvider,
  ];

  /* NewsDbProvider dbProvider = NewsDbProvider();
  NewsApiProvider apiProvider = NewsApiProvider();
*/
  Future<List<int>> fetchTopIds() {
    return sources[0].fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async {
    ItemModel item;
    var source;
    for (source in sources) {
      item = await source.fetchItem(id);
      if (item != null) {
        break;
      }
    }

    for (var cache in caches) {
      if ((cache as Source) != source) {
        cache.addItem(item);
      }
    }
    return item;
  }

  clearCache() async {
    for (var cache in caches) {
      await cache.clear();
    }
  }
}
