import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wahg_v1/commons/caching/app_settings_cache.dart';
import 'package:wahg_v1/const/app_localization/languages_interface.dart';
import 'package:wahg_v1/const/app_localization/app_localization.dart';
import 'package:wahg_v1/const/app_localization/ar_strings.dart';
import 'package:wahg_v1/di/injection_container.dart';
import 'package:wahg_v1/features/domain/usecases/get_hall_usecase.dart';
import 'package:wahg_v1/features/presentation/blocs/category_bloc/category_bloc.dart';
import 'package:wahg_v1/features/presentation/blocs/setting_cubit/setting_cubit.dart';
import 'package:wahg_v1/features/presentation/pages/2.0_halls_list_page/bloc/halls_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.1_dress_list_page/bloc/dresses_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.2_photographer_list_page/bloc/photographer_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.3_cafe_and_restaurant_list_page/bloc/cafe_and_restaurant_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.4_hair_list_page/bloc/hair_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.5_suit_list_page/bloc/suit_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.6_travel_list_page/bloc/travel_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.7_makeup_artist_list_page/bloc/makeup_artist_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/4_drawer_menu/bloc/drawer_bloc.dart';

import 'package:wahg_v1/localization/app_localization.dart';
import 'package:wahg_v1/routing/navigationx.dart';
import 'package:wahg_v1/routing/routing.dart';
import 'package:wahg_v1/theme/bloc/theme_bloc.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/size_utils.dart';

import 'const/app_localization/languages_interface.dart';
import 'firebase_options.dart';
import 'package:wahg_v1/di/injection_container.dart' as di;
import 'package:flutter_localizations/flutter_localizations.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
var scaffoldKey = GlobalKey<ScaffoldState>();

LanguageI txt = const LanguageAr();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  await di.init();
  await di.sl.isReady<SharedPreferences>();
  await di.sl.allReady();

  //TODO delete this >> await di.sl<AppSettingsCache>().setAppLanguage('ar');
  print(
      'Stored AppLanguage ${await di.sl<AppSettingsCache>().getAppLanguage()}');
  await initialize(aLocaleLanguageList: languageList());

  Future.wait([
    // TODO: Load here from sharedPrefrences the Dark Mode Value to apply it
    //  appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
  ]).then((value) {
    runApp(AppRoot());
  });
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  // This widget is the root of your application.
  // will have the MultiProviders
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(lazy: false, create: (_) => CategoryBloc()),
        BlocProvider(lazy: false, create: (_) => HallsBloc()),
        BlocProvider(
            lazy: false, create: (_) => SettingCubit()..setAppLanguage()),
        BlocProvider(
          lazy: false,
          create: (context) => ThemeBloc(
            ThemeState(
              themeType: sl<AppSettingsCache>().getThemeData(),
            ),
          ),
        ),
        BlocProvider<HallsBloc>(
          create: (context) => HallsBloc()..add(GetHallsListEvent()),
        ),
        BlocProvider<DressesBloc>(
          create: (context) => DressesBloc()..add(GetDressesListEvent()),
        ),
        BlocProvider<PhotographerBloc>(
          create: (context) =>
              PhotographerBloc()..add(GetPhotographerListEvent()),
        ),
        BlocProvider<CafeAndRestaurantBloc>(
          create: (context) =>
              CafeAndRestaurantBloc()..add(GetCafeAndRestaurantListEvent()),
        ),
        BlocProvider<HairBloc>(
          create: (context) => HairBloc()..add(GetHairListEvent()),
        ),
        BlocProvider<SuitBloc>(
          create: (context) => SuitBloc()..add(GetSuitListEvent()),
        ),
        BlocProvider<TravelBloc>(
          create: (context) => TravelBloc()..add(GetTravelListEvent()),
        ),
        BlocProvider<MakeupArtistBloc>(
          create: (context) => MakeupArtistBloc()..add(GetMakeupArtistListEvent()),
        ),
        BlocProvider<DrawerBloc>(
          create: (context) => DrawerBloc(),
        )
      ],
      child: AppMaterialApp(),
    );
  }
}

class AppThemeBuilder extends StatelessWidget {
  const AppThemeBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return AppMaterialApp();
      },
    );
  }
}

class AppMaterialApp extends StatelessWidget {
  AppMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return BlocBuilder<SettingCubit, SettingState>(
        builder: (context, state) {
          print(
              '[📍Test] MaterialApp BlocBuilder STARTED ${state.appLanguageLocale}');
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: txt.materialAppTitle,
            navigatorKey: NavigationX.navigatorKey,
            theme: theme,
            localizationsDelegates: const [
              //AppLocalizations(), // This is for cubit localizations
              AppLocalizationDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en', ''),
              Locale('ar', ''),
            ],

            //  locale: state.appLanguageLocale,
            onGenerateRoute: Routers.generateRoute,
          );
        },
      );
    });
  }
}
