import 'package:flutter/material.dart';
import 'package:flutter_product/bottom_navigation.dart';
import 'package:flutter_product/pages/other/not_found.dart';
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
  final supportedLocales = languages.map((language) => Locale(language, ''));
  ThemeData get themeData {
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
        button: TextStyle(fontSize: Constants.fontSizes.text,),
        subhead: TextStyle(height: _model.locale == 'km' ? 0.8 : 1),
        headline: TextStyle(color: Colors.red),
        subtitle: TextStyle(color: Colors.red),
        overline: TextStyle(color: Colors.blue),
        title: TextStyle(
            fontSize: Constants.fontSizes.title,
            height: _model.locale == 'km' ? 0.8 : 1),
        body1: TextStyle(
          fontSize: Constants.fontSizes.text,
          height: _model.locale == 'km' ? 0.8 : 1,
        ),
        body2: TextStyle(
            fontSize: Constants.fontSizes.text,
            height: _model.locale == 'km' ? 0.8 : 1),
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
          !isAuthenticated ? AuthPage() : TabNavigator()
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
