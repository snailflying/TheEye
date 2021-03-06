import 'package:flutter/material.dart';
import 'package:flutter_eye/pages/HomePage.dart';
import 'package:flutter_eye/pages/MinePage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'common/localization/eye_localizations.dart';
import 'common/localization/localizations_delegate.dart';

void main() {
  runApp(MyApp());
}

// MyApp是一个有状态的组件，因为页面标题，页面内容和页面底部Tab都会改变
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new EyeBottomState();
}

class EyeBottomState extends State<MyApp> {
  // 页面当前选中的Tab的索引
  var _tabIndex = 0;
  var _appBarTitles = ['首页', '我的'];

  List<BottomNavigationBarItem> _navigationViews;

// 页面body部分组件
  var _body;

  _initData() {
    _body = IndexedStack(
      children: <Widget>[HomePage(), MinePage()],
      index: _tabIndex,
    );

    _navigationViews = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        label: _appBarTitles[0],
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.person),
        label: _appBarTitles[1],
        backgroundColor: Colors.blue,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _initData();

    return new MaterialApp(
      ///多语言实现代理
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        EyeLocalizationsDelegate.delegate,
      ],
      supportedLocales: EyeLocalizationsDelegate.delegate.local,

      theme: new ThemeData(

          // 设置页面的主题色
          primaryColor: const Color(0xFF63CA6C)),
      home: new Scaffold(
        appBar: new AppBar(
            // 设置AppBar标题
            title:new Text("观眼",
                // 设置AppBar上文本的样式
                style: new TextStyle(color: Colors.white)),

            // 设置AppBar上图标的样式
            iconTheme: new IconThemeData(color: Colors.white)),
        body: _body,
        bottomNavigationBar: BottomNavigationBar(
          items: _navigationViews
              .map((BottomNavigationBarItem navigationView) => navigationView)
              .toList(),
          currentIndex: _tabIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
      ),
    );
  }
}
