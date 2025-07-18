import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:movies_app/models/movie_model.dart';

import '../utils/helpers/storage_helpers.dart';

class MovieCard extends StatelessWidget {
  static String imageUrl = dotenv.env['IMAGE_URL'].toString();
  MovieModel movie;

  MovieCard({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            "$imageUrl${movie.posterPath ?? ""}",
            height: 200,
            width: 160,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 12),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                movie.title ?? "",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.shade100,
                    ),
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      Icons.thumb_up,
                      color: Colors.blue.shade400,
                      size: 12,
                    ),
                  ),
                  Text(
                    movie.voteAverage.toString() ?? "",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(child: SizedBox(width: 10)),
                  Text(
                    movie.releaseDate.toString() ?? "",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              SizedBox(
                child: Text(
                  movie.overview ?? "",
                  maxLines: 5,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              InkWell(
                onTap: (){
                  StorageHelpers.saveFavouriteMovie(movie);
                },
                child: Container(
                  height: 42,
                  width: Get.width,
                  margin: EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: Color(0xff393E46),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "Favorite",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}