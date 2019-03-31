import 'package:flutter/material.dart';
import 'package:flutter_product/bottom_navigation.dart';
import 'package:flutter_product/pages/other/not_found.dart';
import 'package:flutter_product/pages/post/post_detail.dart';
import 'package:flutter_product/utils/constants.dart';
import 'package:flutter_product/widgets/app_builder.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './utils/localization/constants.dart' show languages;
import './utils/localization/app_localizations.dart'
    show
        FallbackCupertinoLocalisationsDelegate,
        MyLocalizationsDelegate,
        Translate;
import './pages/auth.dart';
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
  final supportedLocales = languages.map((language) => Locale(language, ''));
  ThemeData get themeData {
    double lineHeight = _model.locale == 'km' ? 0.9 : 1;
    return ThemeData(
      splashFactory: InkRipple.splashFactory,
      brightness: Brightness.light,
      primaryColor: Constants.colors.primary,
      primarySwatch: Colors.lightBlue,
      accentColor: Colors.blueAccent,
      buttonColor: Colors.red,
      fontFamily: _model.locale == 'km'
          ? Constants.fonts.regular
          : Constants.fonts.regularEn,
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      buttonTheme: ButtonThemeData(
          height: 43,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          textTheme: ButtonTextTheme.primary,
          buttonColor: Constants.colors.primary),
      textTheme: TextTheme(
        button: TextStyle(
          height: lineHeight,
          fontSize: _model.locale == 'km'
              ? Constants.fontSizes.button - 1
              : Constants.fontSizes.button,
        ),
        display1: TextStyle(
          height: _model.locale == 'km' ? 0.9 : 1,
          fontSize: _model.locale == 'km'
              ? Constants.fontSizes.display1 - 1
              : Constants.fontSizes.display1,
        ),
        display2: TextStyle(
          height: lineHeight,
          fontSize: _model.locale == 'km'
              ? Constants.fontSizes.display2 - 1
              : Constants.fontSizes.display2,
        ),
        display3: TextStyle(
          height: lineHeight,
          fontSize: _model.locale == 'km'
              ? Constants.fontSizes.display3 - 1
              : Constants.fontSizes.display3,
        ),
        display4: TextStyle(
          height: lineHeight,
          fontSize: _model.locale == 'km'
              ? Constants.fontSizes.display4 - 1
              : Constants.fontSizes.display4,
        ),
        caption: TextStyle(
          height: lineHeight,
          fontSize: _model.locale == 'km'
              ? Constants.fontSizes.caption - 1
              : Constants.fontSizes.caption,
        ),
        subhead: TextStyle(
          height: lineHeight,
          fontSize: _model.locale == 'km'
              ? Constants.fontSizes.subhead - 1
              : Constants.fontSizes.subhead,
        ),
        headline: TextStyle(
          height: lineHeight,
          fontSize: _model.locale == 'km'
              ? Constants.fontSizes.headline - 1
              : Constants.fontSizes.headline,
          color: Colors.red,
        ),
        subtitle: TextStyle(
          height: lineHeight,
          fontSize: _model.locale == 'km'
              ? Constants.fontSizes.subtitle - 1
              : Constants.fontSizes.subtitle,
          color: Colors.red,
        ),
        overline: TextStyle(
          height: lineHeight,
          fontSize: _model.locale == 'km'
              ? Constants.fontSizes.overline - 1
              : Constants.fontSizes.overline,
          color: Colors.blue,
        ),
        title: TextStyle(
          height: lineHeight,
          fontSize: _model.locale == 'km'
              ? Constants.fontSizes.title - 1
              : Constants.fontSizes.title,
        ),
        body1: TextStyle(
          height: lineHeight,
          fontSize: _model.locale == 'km'
              ? Constants.fontSizes.body1 - 1
              : Constants.fontSizes.body1,
        ),
        body2: TextStyle(
          height: lineHeight,
          fontSize: _model.locale == 'km'
              ? Constants.fontSizes.body2 - 1
              : Constants.fontSizes.body2,
        ),
      ),
    );
  }

  @override
  void initState() {
    _model.autoAuthenticate();
    _model.userSubject.listen((bool isAuthenticated) {
      setState(() {
        _isAuthenticated = isAuthenticated;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBuilder(
      builder: (context) {
        return ScopedModel<MainScopedModel>(
          model: _model,
          child: CommentsProvider(
            child: StoriesProvider(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Material App',
                theme: themeData,
                routes: routes(_isAuthenticated),
                onGenerateRoute: (RouteSettings setting) =>
                    onGenerateRoute(setting),
                onUnknownRoute: (RouteSettings rs) => onUnknownRoute(rs),
                locale: Locale(_model.locale),
                localizationsDelegates: [
                  MyLocalizationsDelegate(widget.localizedValues),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  const FallbackCupertinoLocalisationsDelegate(),
                ],
                supportedLocales: supportedLocales,
              ),
            ),
          ),
        );
      },
    );
  }

  routes(isAuthenticated) {
    return {
      Constants.routes.root: (BuildContext context) =>
          !isAuthenticated ? AuthPage() : TabNavigator(),
    };
  }

  onGenerateRoute(RouteSettings rs) {
    if (!_isAuthenticated) {
      return MaterialPageRoute(
          builder: (BuildContext context) => TabNavigator());
    }
    if (rs.name == '/news') {
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
          final itemId = int.parse(rs.name.replaceFirst('/', ''));

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
  }

  onUnknownRoute(RouteSettings rs) {
    return MaterialPageRoute(
      builder: (context) => NotFoundPage(
            title: 'not found',
          ),
    );
  }
}
