import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/details_responses/DetailsResponses.dart';
import 'package:movie_app/data/model/failures.dart';
import 'package:movie_app/data/model/simillar_responses/SimillarResponses.dart';

abstract class DetailsOnlineDS{

  Future<Either<Failuer,DetailsResponses>> getDetails(String moveID);

  Future<Either<Failuer,List<SimilarResult>>> getSimilarMovie(String moveID);
}