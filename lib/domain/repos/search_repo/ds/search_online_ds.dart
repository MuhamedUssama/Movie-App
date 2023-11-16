import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/failures.dart';
import 'package:movie_app/data/model/search_responses/SearchResponses.dart';

abstract class SearchOnlineDS{

  Future<Either<Failuer,List<SearchResult>>> getListOfSearching(String text);
}