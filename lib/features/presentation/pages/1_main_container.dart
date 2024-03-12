import 'package:flutter/material.dart';
import 'package:wahg_v1/const/app_colors.dart';
import 'package:wahg_v1/features/presentation/fragment/home_fragment.dart';
import 'package:wahg_v1/features/presentation/fragment/jobs_fragment.dart';
import 'package:wahg_v1/features/presentation/pages/0_splash_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.0_halls_list_page/halls_list_page.dart';
import 'package:wahg_v1/widgets/app_widgets/buttons/custom_bottom_bar.dart';
class HPDash extends StatelessWidget {
  static const String id = 'hp_dash';
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

   final List<Widget> tabs = [
    HomeFragment(),
     JobsFragment(),
  ];



  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
            body: Navigator(
                key: navigatorKey,
                initialRoute: HomeFragment.id,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(context, routeSetting.name!),
                    transitionDuration: const Duration(seconds: 0))),
            bottomNavigationBar: _buildBottomBarSection(context)));
  }

  /// Section Widget
  Widget _buildBottomBarSection(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return HomeFragment.id;
      case BottomBarEnum.Jobs:
        return JobsFragment.id;
      case BottomBarEnum.Offers:
        return "/";
      case BottomBarEnum.Profile:
        return "/";

      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
      BuildContext context,
      String currentRoute,
      ) {
    switch (currentRoute) {
      case HomeFragment.id:
        return HomeFragment();
        case JobsFragment.id:
        return JobsFragment();
      case HallsListPage.id:
        return HallsListPage();
      default:
        return DefaultWidget();
    }
  }
}



