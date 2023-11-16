import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/failures.dart';
import 'package:movie_app/data/model/movies_of_category/MoviesOfCategoryResponse.dart';

abstract class MoviesOfCategoryRepo{

  Future<Either<Failuer,List<MoviesResults>>> getMovies(String categoryName);
}