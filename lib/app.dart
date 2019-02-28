import 'package:flutter/material.dart';
import 'package:flutter_product/bottom_navigation.dart';
import 'package:flutter_product/utils/constants.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './utils/localization/constants.dart' show languages;
import './utils/localization/app_localizations.dart'
    show
        FallbackCupertinoLocalisationsDelegate,
        MyLocalizationsDelegate,
        Translate;

// import 'package:flutter/rendering.dart';
import './pages/auth.dart';
import './pages/home.dart';
import './scoped-models/main.dart';
import 'blocs/stories_provider.dart';
import 'blocs/comments_provider.dart';
import 'pages/news_list.dart';
import 'pages/news_detail.dart';

class MyApp extends StatefulWidget {
  final Map<String, Map<String, String>> localizedValues;
  MyApp(this.localizedValues);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final MainScopedModel _model = MainScopedModel();
  bool _isAuthenticated = false;
  String _locale = 'km';
  onChangeLanguage() {
    if (_locale == 'en') {
      setState(() {
        _locale = 'km';
      });
    } else {
      setState(() {
        _locale = 'en';
      });
    }
  }

  final routes = {
    Constants.routes.root: (BuildContext context) => TabNavigator(),
  };

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
              splashFactory: InkRipple.splashFactory,
              brightness: Brightness.light,
              primarySwatch: Colors.deepOrange,
              accentColor: Colors.deepPurple,
              buttonColor: Colors.deepPurple,
              //change_font when language changed
              //     fontFamily: stateContainer.currentLanguage != null
              // ? stateContainer.currentLanguage.code == "en"
              //     ? Fonts.dinNextFont
              //     : Fonts.khBoeungFont
              // : null,
            ),
            // home: AuthPage(),
            routes: {
              '/': (BuildContext context) =>
                  // !_isAuthenticated ? AuthPage() : HomePage(_model),
                  // !_isAuthenticated ? AuthPage() : TabNavigator(),
                  TabNavigator()
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
            locale: Locale(_locale),
            localizationsDelegates: [
              MyLocalizationsDelegate(widget.localizedValues),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              const FallbackCupertinoLocalisationsDelegate(),
            ],
            supportedLocales: languages.map((language) => Locale(language, '')),
          ),
        ),
      ),
    );
  }

  // onUnknownRoute(RouteSettings rs) {
  //   return MaterialPageRoute(
  //     builder: (context) => NotFoundPage(
  //           appTitle: Constants.coming_soon,
  //           icon: FontAwesomeIcons.solidSmile,
  //           title: Constants.coming_soon,
  //           message: "Under Development",
  //           iconColor: Colors.green,
  //         ),
  //   );
  // }
}
