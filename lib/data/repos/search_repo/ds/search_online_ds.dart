import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/model/failures.dart';
import 'package:movie_app/data/model/search_responses/SearchResponses.dart';
import 'package:movie_app/domain/repos/search_repo/ds/search_online_ds.dart';
import 'package:movie_app/ui/utils/constants.dart';
import 'package:movie_app/ui/utils/end_points.dart';

@Injectable(as: SearchOnlineDS)
class SearchOnlineDSImpl extends SearchOnlineDS{
  @override
  Future<Either<Failuer, List<SearchResult>>> getListOfSearching(String text) async{
    try{
      Uri url = Uri.https(EndPoints.baseUrl , EndPoints.search ,{
        "api_key" : EndPoints.apiKey,
        "query" : text,
        "language" : "en-US "
      } );
      Response serverResponse =  await get(url);
      Map json = jsonDecode(serverResponse.body);
      SearchResponses responses = SearchResponses.fromJson(json);
      if(serverResponse.statusCode >=200 && serverResponse.statusCode < 300 && responses.results!.isNotEmpty == true ){
        return right(responses.results!);
      }else{
        return left(Failuer(responses.message??Constants.defaultErrorMessage));
      }
    }catch(e){
      return left(Failuer(Constants.defaultErrorMessage));
    }
  }


}