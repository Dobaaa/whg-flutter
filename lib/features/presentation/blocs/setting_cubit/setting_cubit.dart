import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wahg_v1/commons/caching/app_settings_cache.dart';
import 'package:wahg_v1/const/app_defaults.dart';
import 'package:wahg_v1/const/app_keys.dart';
import 'package:wahg_v1/const/app_localization/languages_interface.dart';
import 'package:wahg_v1/const/app_localization/app_localization.dart';
import 'package:wahg_v1/const/app_localization/ar_strings.dart';
import 'package:wahg_v1/const/app_localization/en_strings.dart';
import 'package:wahg_v1/const/app_theme.dart';
import 'package:wahg_v1/main.dart';
import 'package:wahg_v1/di/injection_container.dart' as di;
import 'package:nb_utils/nb_utils.dart';
part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingState());

  Future<bool> getAppSettings() async {
    bool isDark = await di.sl<AppSettingsCache>().getDarkMode();
    String appLanguageCode = await di.sl<AppSettingsCache>().getAppLanguage();
    toggleDarkMode(isDark);
    setAppLanguage(value: appLanguageCode);

    emit(state.copyWith(isDarkMode: isDark));
    return isDark;
  }

  Future<void> toggleDarkMode(bool value) async {
    if (state.appTheme == Themes.lightTheme) {
      setDarkStatusBar();
      emit(state.copyWith(appTheme: Themes.darkTheme, isDarkMode: true));
    } else {
      setLightStatusBar();
      emit(state.copyWith(appTheme: Themes.lightTheme, isDarkMode: false));
    }
    di.sl<AppSettingsCache>().setDarkMode(value);
  }

  Future<void> setAppLanguage({String? value, BuildContext? context}) async {
    String cached;
    bool rtl;
    /// this to change App Language from settings
    if (value != null) {
      cached = value;
      await di.sl<AppSettingsCache>().setAppLanguage(value);
    } else {
      /// this to load App Language in start
      cached = await di.sl<AppSettingsCache>().getAppLanguage();
    }
    rtl = await di.sl<AppSettingsCache>().getRTL();
    txt = await const AppLocalizations().load(Locale(cached, ''));
    emit(state.copyWith(
        appLanguageCode: cached,
        appLanguageLocale: Locale(cached, ''),
        appStrings: txt,
        isRTL: rtl));
  }
}
