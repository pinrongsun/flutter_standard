import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
// import 'package:flutter/rendering.dart';

import './pages/auth.dart';
import './pages/home.dart';
import './scoped-models/main.dart';

import 'blocs/stories_provider.dart';
import 'blocs/comments_provider.dart';
import 'pages/news_list.dart';
import 'pages/news_detail.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final MainScopedModel _model = MainScopedModel();
  bool _isAuthenticated = false;

  @override
  void initState() {
    _model.autoAuthenticate();
    _model.userSubject.listen((bool isAuthenticated) {
      setState(() {
        print('called setState');
        _isAuthenticated = isAuthenticated;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('building main page');
    return ScopedModel<MainScopedModel>(
      model: _model,
      child: CommentsProvider(
        child: StoriesProvider(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'sample!',
            // debugShowMaterialGrid: true,
            theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.deepOrange,
                accentColor: Colors.deepPurple,
                buttonColor: Colors.deepPurple),
            // home: AuthPage(),
            routes: {
              '/': (BuildContext context) =>
                  !_isAuthenticated ? AuthPage() : HomePage(_model),
            },
            onGenerateRoute: (RouteSettings settings) {
              if (!_isAuthenticated) {
                return MaterialPageRoute(
                  builder: (BuildContext context) => AuthPage(),
                );
              }
              if (settings.name == '/news') {
                return !_isAuthenticated
                    ? AuthPage()
                    : MaterialPageRoute(
                        builder: (context) {
                          final bloc = StoriesProvider.of(context);
                          bloc.fetchTopIds();
                          return NewsList();
                        },
                      );
              } else {
                return MaterialPageRoute(
                  builder: (context) {
                    final commentsBloc = CommentsProvider.of(context);
                    final itemId =
                        int.parse(settings.name.replaceFirst('/', ''));

                    commentsBloc.fetchItemWithComments(itemId);

                    return NewsDetail(
                      itemId: itemId,
                    );
                  },
                );
              }
              /* if (!_isAuthenticated) {
            return MaterialPageRoute<bool>(
              builder: (BuildContext context) => AuthPage(),
            );
          }
         final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'product') {
            final String productId = pathElements[2];
            final Product product =
            _model.allProducts.firstWhere((Product product) {
              return product.id == productId;
            });
            return MaterialPageRoute<bool>(
              builder: (BuildContext context) =>
              !_isAuthenticated ? AuthPage() : ProductPage(product),
            );
          }
          return null;*/
            },
            onUnknownRoute: (RouteSettings settings) {
              return MaterialPageRoute(
                  builder: (BuildContext context) =>
                      !_isAuthenticated ? AuthPage() : HomePage(_model));
            },
          ),
        ),
      ),
    );
  }

}
