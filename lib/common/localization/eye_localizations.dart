import 'dart:ui';

import 'package:flutter/material.dart';

import 'string_base.dart';
import 'string_en.dart';
import 'string_zh.dart';

/// @Author ZhiQiang
/// @Date 2020/10/19
/// @Description 自定义多语言实现
class EyeLocalizations {
  final Locale locale;

  EyeLocalizations(this.locale);

  ///根据不同 locale.languageCode 加载不同语言对应
  ///GSYStringEn和GSYStringZh都继承了GSYStringBase
  static Map<String, StringBase> _localizedValues = {
    'en': new StringEn(),
    'zh': new StringZh(),
  };

  StringBase get currentLocalized {
    if (_localizedValues.containsKey(locale.languageCode)) {
      return _localizedValues[locale.languageCode];
    }
    return _localizedValues["zh"];
  }

  ///通过 Localizations 加载当前的 GSYLocalizations
  ///获取对应的 GSYStringBase
  static EyeLocalizations of(BuildContext context) {
    return Localizations.of(context, EyeLocalizations);
  }

  ///通过 Localizations 加载当前的 GSYLocalizations
  ///获取对应的 GSYStringBase
  static StringBase i18n(BuildContext context) {
    return of(context).currentLocalized;
  }
}
