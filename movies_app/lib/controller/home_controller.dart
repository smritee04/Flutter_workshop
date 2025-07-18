import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/utils/constants/api.dart';
import 'package:movies_app/utils/helpers/storage_helpers.dart';

class HomeController extends GetxController {
  RxList<MovieModel> movies = RxList();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  Future<void> fetchMovies() async {
    isLoading.value = true;
    movies.clear();
    var url = Uri.parse(API.fetchMovies);
    var response = await http.get(
      url,
      headers: {"Authorization": "Bearer ${API.accessToken}"},
    );

    dynamic data = json.decode(response.body);
    movies.value = moviesFromJson(data['results']);
    isLoading.value = false;
    print(response.body);
  }

  void addToFavourites(MovieModel movie){
    StorageHelpers.saveFavouriteMovie(movie);
  }
}