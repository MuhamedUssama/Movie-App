import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/categories_name_responses/Genres.dart';
import 'package:movie_app/data/model/failures.dart';

abstract class CategoriesOnlineDS{

  Future<Either<Failuer,List<CategoryGenres>>> getCategoriesName();
}