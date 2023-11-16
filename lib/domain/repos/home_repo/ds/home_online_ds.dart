import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/popular_responsses/popularResponses.dart';
import 'package:movie_app/data/model/recommended_responses/RecommendedResponses.dart';
import 'package:movie_app/data/model/releases_responses/ReleasesResponses.dart';

import '../../../../data/model/failures.dart';

abstract class HomeOnlineDS {

  Future<Either<Failuer,List<PopularResult>>> getPopular();

  Future<Either<Failuer,List<ReleasesResult>>> getReleases();

  Future<Either<Failuer,List<RecommendedResult>>> getRecommended();

}