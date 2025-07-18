import 'package:get/get.dart';
import 'package:movies_app/controller/dashboard_controller.dart';
import 'package:movies_app/controller/favourite_controller.dart';
import 'package:movies_app/controller/home_controller.dart';
import 'package:movies_app/controller/splash_controller.dart';
import 'package:movies_app/views/dashboard.dart';
import 'package:movies_app/views/home_page.dart';
import 'package:movies_app/views/splash_page.dart';

final List<GetPage> getPages = <GetPage>[
  GetPage(
    name: SplashPage.routeName,
    page: () => SplashPage(),
    binding: BindingsBuilder(() {
      Get.lazyPut(() => SplashController());
    }),
  ),
  GetPage(
    name: HomePage.routeName,
    page: () => HomePage(),

  ),
  GetPage(
    name: Dashboard.routeName,
    page: () => Dashboard(),
    binding: BindingsBuilder(() {
      Get.lazyPut(() => DashboardController());
      Get.lazyPut(() => HomeController());
      Get.lazyPut(() => FavouriteController());
    }),
  ),
];