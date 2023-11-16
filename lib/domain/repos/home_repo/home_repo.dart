import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/failures.dart';
import 'package:movie_app/data/model/popular_responsses/popularResponses.dart';
import 'package:movie_app/data/model/recommended_responses/RecommendedResponses.dart';
import 'package:movie_app/data/model/releases_responses/ReleasesResponses.dart';

abstract class HomeRepo{

  Future<Either<Failuer,List<PopularResult>>> getPopular();

  Future<Either<Failuer,List<ReleasesResult>>> getReleases();

  Future<Either<Failuer,List<RecommendedResult>>> getRecommended();

}