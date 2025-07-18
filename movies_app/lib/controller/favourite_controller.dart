import 'package:get/get.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/utils/helpers/storage_helpers.dart';

class FavouriteController extends GetxController {
  RxList<MovieModel> favouritesMovie = RxList();
  RxBool isLoading = false.obs;


  @override
  void onInit(){
    fetchFavMovies();
    super.onInit();
  }

  fetchFavMovies(){
    isLoading.value=true;
    favouritesMovie.clear();
    favouritesMovie.addAll(StorageHelpers.getMovies());
    isLoading.value=false;

  }
}