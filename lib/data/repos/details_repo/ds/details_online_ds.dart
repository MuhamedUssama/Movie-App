import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/model/details_responses/DetailsResponses.dart';
import 'package:movie_app/data/model/failures.dart';
import 'package:movie_app/data/model/simillar_responses/SimillarResponses.dart';
import 'package:movie_app/domain/repos/details_repo/ds/details_online_ds.dart';
import 'package:movie_app/ui/utils/constants.dart';
import 'package:movie_app/ui/utils/end_points.dart';


@Injectable(as: DetailsOnlineDS)
class DetailsOnlineDSImpl extends DetailsOnlineDS{


  @override
  Future<Either<Failuer, DetailsResponses>> getDetails(String moveID) async{
    try{
      Uri url = Uri.https(EndPoints.baseUrl, "3/movie/$moveID",{
        "api_key" : EndPoints.apiKey,
      });
      Response serverResponse = await get(url);
      DetailsResponses responses = DetailsResponses.fromJson(jsonDecode(serverResponse.body));

      if(serverResponse.statusCode >= 200 && serverResponse.statusCode < 300 ){
        return right(responses);
      }else{
        return left(Failuer(responses.message??Constants.defaultErrorMessage));
      }
    }catch(e){
      print("DetailsOnlineDSImpl : getDetails : $e");
      return left(Failuer(Constants.defaultErrorMessage));
    }
  }

  @override
  Future<Either<Failuer, List<SimilarResult>>> getSimilarMovie(String moveID) async{
    try{
      Uri url = Uri.https(EndPoints.baseUrl,"3/movie/$moveID/similar",{
        "api_key" : EndPoints.apiKey,
      });
      Response serverResponse = await get(url);
      SimilarResponses responses = SimilarResponses.fromJson(jsonDecode(serverResponse.body));

      if(serverResponse.statusCode >= 200 && serverResponse.statusCode < 300 ){
        return right(responses.results!);
      }else{
        return left(Failuer(responses.message??Constants.defaultErrorMessage));
      }
    }catch(e){
      print("DetailsOnlineDSImpl : getDetails : $e");
      return left(Failuer(Constants.defaultErrorMessage));
    }
  }


}