import 'package:get/get.dart';
import '../pages/bottomnavigation/views/bottomnavigation.dart';
import '../pages/splash/views/splash.dart';

class GetPages {
  static const String splash = '/';
  static const String bottomNavigation = '/bottomNavigation';
  static const String allSpending = '/allSpending';
  static const String spending = '/spending';
  static const String allCategory = '/allCategory';
  static const String category = '/category';

  static List<GetPage> getPages = [
    GetPage(name: splash, page: () => const SplashPage()),
    GetPage(name: bottomNavigation, page: () => const BottomNavigationPage()),
  ];
}
