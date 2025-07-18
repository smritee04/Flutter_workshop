import 'package:flutter_dotenv/flutter_dotenv.dart';

class API {
  static String baseUrl = dotenv.env['API_URL'].toString();
  static String accessToken = dotenv.env['AUTHORIZATION_TOKEN'].toString();
  static String fetchMovies = "${baseUrl}discover/movie";
}