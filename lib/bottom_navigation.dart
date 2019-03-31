//packages
import 'package:flutter/material.dart';
import 'package:flutter_product/drawer.dart';
import 'package:flutter_product/pages/home/home.dart';
import 'package:flutter_product/scoped-models/main.dart';
import 'package:flutter_product/utils/constants.dart';
import 'package:flutter_product/widgets/activity_indicator.dart';
import 'package:scoped_model/scoped_model.dart';
import './utils/icon_font.dart';
import './pages/comment.dart';
import './pages/message.dart';

/* navigation icon view */
class NavigationIconView {
  NavigationIconView({
    Widget icon,
    Widget activeIcon,
    String title,
    @required String key,
    Color color,
    TickerProvider vsync,
  })  : _icon = icon,
        _color = color,
        _key = key,
        _title = title,
        item = BottomNavigationBarItem(
          icon: icon,
          activeIcon: activeIcon,
          title: Container(),
          backgroundColor: color,
        ),
        controller = AnimationController(
          duration: kThemeAnimationDuration,
          vsync: vsync,
        ) {
    _animation = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
  }

  final Widget _icon;
  final String _key;
  final Color _color;
  final String _title;
  final BottomNavigationBarItem item;
  final AnimationController controller;
  CurvedAnimation _animation;

  FadeTransition transition(
      BottomNavigationBarType type, BuildContext context) {
    Color iconColor;
    if (type == BottomNavigationBarType.shifting) {
      iconColor = _color;
    } else {
      final ThemeData themeData = Theme.of(context);
      iconColor = themeData.brightness == Brightness.light
          ? themeData.primaryColor
          : themeData.accentColor;
    }

    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 0.02), // Slightly down.
          end: Offset.zero,
        ).animate(_animation),
        child: IconTheme(
          data: IconThemeData(
            color: iconColor,
            size: 120.0,
          ),
          child: Semantics(
            // label: 'Placeholder for $_title tab',
            child: _icon,
          ),
        ),
      ),
    );
  }
}

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator>
    with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  BottomNavigationBarType _type = BottomNavigationBarType.fixed;
  List<NavigationIconView> _navigationViews;
  int _tab = 0;
  final String homeKey = "home";
  final String commentKey = "comment";
  final String messageKey = "message";

  List<NavigationIconView> __navigationViews() {
    _navigationViews = [
      NavigationIconView(
        key: homeKey,
        activeIcon: Icon(FeatherIcons.home),
        icon: Icon(FeatherIcons.home),
        title: "Home",
        color: Constants.colors.primary,
        vsync: this,
      ),
      NavigationIconView(
        key: commentKey,
        activeIcon: Icon(FeatherIcons.edit3),
        icon: Icon(FeatherIcons.edit3),
        title: "Comment",
        color: Colors.indigo,
        vsync: this,
      ),
      NavigationIconView(
        key: messageKey,
        activeIcon: Icon(FeatherIcons.message_square),
        icon: Icon(FeatherIcons.message_square),
        title: "Message",
        color: Colors.teal,
        vsync: this,
      ),
    ];
    return _navigationViews;
  }

  @override
  void initState() {
    super.initState();
    _navigationViews = __navigationViews();

    for (NavigationIconView view in _navigationViews)
      view.controller.addListener(_rebuild);

    _navigationViews[_tab].controller.value = 1.0;
  }

  @override
  void dispose() {
    for (NavigationIconView view in _navigationViews) view.controller.dispose();
    super.dispose();
  }

  void _rebuild() {
    setState(() {
      // Rebuild in order to animate views.
    });
  }

  void onNavigationIconViewTab(int index, String key) {
    setState(() {
      _navigationViews[_tab].controller.reverse();
      _tab = index;
      _navigationViews[_tab].controller.forward();
    });
  }

  BottomNavigationBar botNavBar() {
    return BottomNavigationBar(
      items: __navigationViews()
          .map((NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _tab,
      type: _type,
      onTap: (int index) =>
          onNavigationIconViewTab(index, _navigationViews[index]._key),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        ScopedModel.of<MainScopedModel>(context, rebuildOnChange: true)
            .isLoading;
    return ActivityIndicatorOverlay(
      inAsyncCall: isLoading,
      progressIndicator: ActivityIndicator(
        color: Constants.colors.primary,
      ),
      child: Scaffold(
        key: scaffoldKey,
        appBar: buildAppBar(),
        drawer: CustomDrawer(onTabMenuTap: onNavigationIconViewTab),
        body: Stack(
          children: <Widget>[
            Offstage(
              offstage: _tab != 0,
              child: HomePage(),
            ),
            Offstage(
              offstage: _tab != 1,
              child: CommentPage(),
            ),
            Offstage(
              offstage: _tab != 2,
              child: MessagePage(),
            ),
          ],
        ),
        bottomNavigationBar: botNavBar(),
        // bottomNavigationBar:
        //     BottomNavigationDotBar(// Usar -> "BottomNavigationDotBar"
        //         items: <BottomNavigationDotBarItem>[
        //   BottomNavigationDotBarItem(icon: Icons.alarm_add, onTap: () {
        //     onNavigationIconViewTab(0, _navigationViews[0]._key);
        //   }),
        //   BottomNavigationDotBarItem(icon: Icons.alarm_add, onTap: () {
        //     onNavigationIconViewTab(1, _navigationViews[1]._key);
        //   }),
        //   BottomNavigationDotBarItem(icon: Icons.alarm_add, onTap: () {
        //     onNavigationIconViewTab(2, _navigationViews[2]._key);
        //   }),
        // ]),
      ),
    );
  }

  Widget buildAppBar() {
    return null;
  }
}
