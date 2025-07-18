import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controller/dashboard_controller.dart';
import 'package:movies_app/views/favourites_page.dart';
import 'package:movies_app/views/home_page.dart';

class Dashboard extends StatelessWidget {
  static const routeName = "/dashboard-page";

  final c = Get.find<DashboardController>();

  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff393E46),
        title: Text(
          "Flicksy",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Obx(() {
        if (c.selectedIndex.value == 0) {
          return HomePage();
        } else if (c.selectedIndex.value == 1) {
          return FavouritesPage();
        } else {
          return Container();
        }
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          backgroundColor: Color(0xff393E46),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: c.selectedIndex.value,
          onTap: (index) {
            c.selectedIndex.value = index;
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorites",
            ),
          ],
        );
      }),
    );
  }
}