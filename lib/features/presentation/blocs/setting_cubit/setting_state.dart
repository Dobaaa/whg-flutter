part of 'setting_cubit.dart';

class SettingState extends Equatable {
  // Here will add app settings like (Theme, Language, ... )
  ThemeData? appTheme = appThemeDefault;
  bool isDarkMode;
  String appLanguageCode;
  Locale appLanguageLocale;
  LanguageI appStrings;
  bool isRTL;

  SettingState({
    this.appTheme,
    this.appLanguageCode = defaultLanguageKey,
    this.isDarkMode = isDarkModeDefault,
    this.appLanguageLocale = appLanguageLocaleDefault,
    this.appStrings = appStringsDefault,
    this.isRTL = isRTLDefault,
  });

  @override
  List<Object?> get props =>
      [appTheme, appLanguageCode, appLanguageLocale, appStrings];

  SettingState copyWith({
    ThemeData? appTheme,
    bool? isDarkMode,
    String? appLanguageCode,
    Locale? appLanguageLocale,
    LanguageI? appStrings,
    bool? isRTL,
  }) {
    return SettingState(
      appTheme: appTheme ?? this.appTheme,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      appLanguageCode: appLanguageCode ?? this.appLanguageCode,
      appLanguageLocale: appLanguageLocale ?? this.appLanguageLocale,
      appStrings: appStrings ?? this.appStrings,
      isRTL: isRTL ?? this.isRTL,
    );
  }
}
