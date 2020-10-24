import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'eye_localizations.dart';

/// @Author ZhiQiang
/// @Date 2020/10/19
/// @Description 多语言代理
class EyeLocalizationsDelegate extends LocalizationsDelegate<EyeLocalizations> {

  EyeLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    ///支持中文和英语
    return true;
  }

  ///根据locale，创建一个对象用于提供当前locale下的文本显示
  @override
  Future<EyeLocalizations> load(Locale locale) {
    return new SynchronousFuture<EyeLocalizations>(new EyeLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<EyeLocalizations> old) {
    return false;
  }

  ///全局静态的代理
  static EyeLocalizationsDelegate delegate = new EyeLocalizationsDelegate();
}
