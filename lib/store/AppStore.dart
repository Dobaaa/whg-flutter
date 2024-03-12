import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wahg_v1/const/app_colors.dart';
import 'package:wahg_v1/const/app_keys.dart';
import '../../main.dart';

part 'AppStore.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  @observable
  bool isGoogleSignedIn = false;

  @observable
  String googleUserName = '';

  @observable
  String googleUserEmail = '';

  @observable
  String googleUserPhotoUrl = '';

  @observable
  bool isDarkModeOn = false;

  @observable
  Color? scaffoldBackground;

  @observable
  Color? appColorPrimaryLightColor;

  @observable
  Color? backgroundColor;

  @observable
  Color? backgroundSecondaryColor;

  @observable
  Color? textPrimaryColor;

  @observable
  Color? textSecondaryColor;

  @observable
  Color? appBarColor;

  @observable
  Color? iconColor;

  @observable
  Color? iconSecondaryColor;

  @observable
  String selectedLanguageCode = defaultLanguageKey;

  @observable
  var selectedDrawerItem = -1;

  @action
  Future<void> toggleDarkMode({bool? value}) async {
    isDarkModeOn = value ?? !isDarkModeOn;

    if (isDarkModeOn) {
      scaffoldBackground = AppColors.appBackgroundColorDark;

      appBarColor = AppColors.appBackgroundColorDark;
      backgroundColor = Colors.white;
      backgroundSecondaryColor = Colors.white;
      appColorPrimaryLightColor = AppColors.cardBackgroundBlackDark;

      iconColor = AppColors.iconColorPrimary;
      iconSecondaryColor = AppColors.iconColorSecondary;

      textPrimaryColor = whiteColor;
      textSecondaryColor = Colors.white54;

      textPrimaryColorGlobal = whiteColor;
      textSecondaryColorGlobal = Colors.white54;
      shadowColorGlobal = AppColors.appShadowColorDark;
    } else {
      scaffoldBackground = whiteColor;

      appBarColor = Colors.white;
      backgroundColor = Colors.black;
      backgroundSecondaryColor = AppColors.appSecondaryBackgroundColor;
      appColorPrimaryLightColor = AppColors.appColorPrimaryLight;

      iconColor = AppColors.iconColorPrimaryDark;
      iconSecondaryColor = AppColors.iconColorSecondaryDark;

      textPrimaryColor = AppColors.appTextColorPrimary;
      textSecondaryColor = AppColors.appTextColorSecondary;

      textPrimaryColorGlobal = AppColors.appTextColorPrimary;
      textSecondaryColorGlobal = AppColors.appTextColorSecondary;
      shadowColorGlobal = AppColors.appShadowColor;
    }
    setStatusBarColor(scaffoldBackground!);

    setValue(isDarkModeKey, isDarkModeOn);
  }


  @action
  void setDrawerItemIndex(int aIndex) {
    selectedDrawerItem = aIndex;
  }

  @action
  Future<void> setValueGoogleSignIn({bool? val}) async {
    isGoogleSignedIn = val ?? !isGoogleSignedIn;

    setValue(isGoogleSignedInOnKey, isGoogleSignedIn);
  }

  @action
  Future<void> setGoogleUserName({String? name}) async {
    googleUserName = name!;

    setValue(USER_NAME, googleUserName);
  }

  @action
  Future<void> setGoogleUserEmail({String? email}) async {
    googleUserEmail = email!;

    setValue(USER_EMAIL, googleUserEmail);
  }

  @action
  Future<void> setGoogleUserPhotoUrl({String? photoUrl}) async {
    googleUserPhotoUrl = photoUrl!;

    setValue(USER_IMAGE, googleUserPhotoUrl);
  }
}
