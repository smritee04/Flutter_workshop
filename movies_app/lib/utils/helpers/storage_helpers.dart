import 'package:get_storage/get_storage.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/utils/constants/storage_keys.dart';

class StorageHelpers {
  static void saveFavouriteMovie(MovieModel movie) {
    final box = GetStorage();
    final rawMovies = box.read<List>(StorageKeys.FAVOURITE_KEY) ?? [];
    final movies = rawMovies.map((e) => MovieModel.fromJson(e)).toList();

    // Avoid duplicates (optional)
    if (!movies.any((m) => m.id == movie.id)) {
      movies.add(movie);
      final jsonList = movies.map((m) => m.toJson()).toList();
      box.write(StorageKeys.FAVOURITE_KEY, jsonList);
    }
  }

  static List<MovieModel> getMovies() {
    final box = GetStorage();
    final rawMovies = box.read<List>(StorageKeys.FAVOURITE_KEY) ?? [];
    return rawMovies.map((e) => MovieModel.fromJson(e)).toList();
  }

  static void deleteMovie(MovieModel movie) {
    final box = GetStorage();
    final rawMovies = box.read<List>(StorageKeys.FAVOURITE_KEY) ?? [];
    final movies = rawMovies.map((e) => MovieModel.fromJson(e)).toList();

    // Avoid duplicates (optional)
    if (!movies.any((m) => m.id == movie.id)) {
      movies.remove(movie);
      final jsonList = movies.map((m) => m.toJson()).toList();
      box.write(StorageKeys.FAVOURITE_KEY, jsonList);
    }
  }

}