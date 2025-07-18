import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:movies_app/controller/home_controller.dart';
import 'package:movies_app/widgets/movie_card.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/home-page";

  final c = Get.find<HomeController>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Obx(() {
                if (c.isLoading.value) {
                  return CircularProgressIndicator();
                } else {
                  return ListView.separated(
                    separatorBuilder: (_, __) {
                      return SizedBox(height: 22);
                    },
                    itemCount: c.movies.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    // allows outer scroll view to handle scrolling
                    itemBuilder: (context, index) {
                      return MovieCard(movie: c.movies[index]);
                    },
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}