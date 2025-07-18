import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controller/favourite_controller.dart';
import 'package:movies_app/utils/helpers/storage_helpers.dart';

import '../widgets/movie_card.dart';

class FavouritesPage extends StatelessWidget {
  final c = Get.find<FavouriteController>();

  FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1),(){
      c.fetchFavMovies();

    });
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Obx(() {
                if (c.isLoading.value) {
                  return CircularProgressIndicator();
                } else {
                  return ListView.separated(
                    separatorBuilder: (_, __) {
                      return SizedBox(height: 22);
                    },
                    itemCount: c.favouritesMovie.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    // allows outer scroll view to handle scrolling
                    itemBuilder: (context, index) {
                      return MovieCard(movie: c.favouritesMovie[index]);
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