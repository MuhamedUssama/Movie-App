import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/model/failures.dart';
import 'package:movie_app/data/model/movies_of_category/MoviesOfCategoryResponse.dart';
import 'package:movie_app/domain/repos/movies_of_category_repo/ds/movies_of_category_online_ds.dart';
import 'package:movie_app/ui/utils/constants.dart';
import 'package:movie_app/ui/utils/end_points.dart';


@Injectable(as:MoviesOfCategoryOnlineDS)
class MoviesOfCategoryOnlineDSImpl extends MoviesOfCategoryOnlineDS{
  @override
  Future<Either<Failuer, List<MoviesResults>>> getMovies(String categoryName) async{
    try{
      Uri url = Uri.https(EndPoints.baseUrl,EndPoints.moviesOfCategory,{
        "api_key":EndPoints.apiKey,
        "with_genres": categoryName,
      });

      Response serverResponse = await get(url);
      MoviesOfCategoryResponse response = MoviesOfCategoryResponse.fromJson(jsonDecode(serverResponse.body));

      print("************************");
      if(serverResponse.statusCode >= 200 && serverResponse.statusCode < 300 && response.results?.isNotEmpty == true){
        return right(response.results!);
      }else{
        return left(Failuer(response.message??Constants.defaultErrorMessage));
      }

    }catch(e,ee){
      print("MoviesOfCategoryOnlineDSImpl::getMovies::$e::$ee");
      return left(Failuer(Constants.defaultErrorMessage));
    }
  }
  
  
}