import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/model/failures.dart';
import 'package:movie_app/data/model/popular_responsses/popularResponses.dart';
import 'package:movie_app/data/model/recommended_responses/RecommendedResponses.dart';
import 'package:movie_app/data/model/releases_responses/ReleasesResponses.dart';
import 'package:movie_app/domain/repos/home_repo/ds/home_online_ds.dart';
import 'package:movie_app/ui/utils/constants.dart';
import 'package:movie_app/ui/utils/end_points.dart';

@Injectable(as: HomeOnlineDS)
class HomeOnlineDSImpl extends HomeOnlineDS{

  @override
  Future<Either<Failuer, List<PopularResult>>> getPopular() async{
    try{
      Uri url = Uri.https(EndPoints.baseUrl ,EndPoints.popular,{
        "api_key":EndPoints.apiKey
      } );
      Response serverResponse = await get(url);
      PopularResponses response = PopularResponses.fromJson(jsonDecode(serverResponse.body));
      if(serverResponse.statusCode >=200 && serverResponse.statusCode <300 && response.results?.isNotEmpty == true){
        return right(response.results!);
      }else{
        return left(Failuer(response.message!));
      }
    }catch(e){
      return left(Failuer(Constants.defaultErrorMessage));
    }

  }

  @override
  Future<Either<Failuer, List<RecommendedResult>>> getRecommended() async{
    try{
      Uri url = Uri.https(EndPoints.baseUrl ,EndPoints.recommended ,{
        "api_key":EndPoints.apiKey
      } );
      Response serverResponse = await get(url);
      RecommendedResponses response = RecommendedResponses.fromJson(jsonDecode(serverResponse.body));
      if(serverResponse.statusCode >=200 && serverResponse.statusCode <300 && response.results?.isNotEmpty == true){
        return right(response.results!);
      }else{
        return left(Failuer(response.message!));
      }
    }catch(e){
      return left(Failuer(e.toString()??Constants.defaultErrorMessage));
    }
  }

  @override
  Future<Either<Failuer, List<ReleasesResult>>> getReleases() async{
    try{
      Uri url = Uri.https(EndPoints.baseUrl ,EndPoints.newRelease,{
        "api_key":EndPoints.apiKey
      } );
      Response serverResponse = await get(url);
      ReleasesResponses response = ReleasesResponses.fromJson(jsonDecode(serverResponse.body));
      if(serverResponse.statusCode >=200 && serverResponse.statusCode <300 && response.results?.isNotEmpty == true){
        return right(response.results!);
      }else{
        return left(Failuer(response.message!));
      }
    }catch(e){
      return left(Failuer(Constants.defaultErrorMessage));
    }
  }


}