import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/model/categories_name_responses/CategoriesResponse.dart';
import 'package:movie_app/data/model/categories_name_responses/Genres.dart';
import 'package:movie_app/data/model/failures.dart';
import 'package:movie_app/domain/repos/category_repo/ds/category_name_ds.dart';
import 'package:movie_app/ui/utils/constants.dart';
import 'package:movie_app/ui/utils/end_points.dart';

@Injectable(as:CategoriesOnlineDS )
class CategoriesOnlineDSImpl extends CategoriesOnlineDS {
  @override
  Future<Either<Failuer, List<CategoryGenres>>> getCategoriesName()async{
  try{
    Uri url = Uri.https(EndPoints.baseUrl,EndPoints.categoriesName,{
      "api_key":EndPoints.apiKey
    });
    Response serverResponse = await get(url);
    CategoriesResponse response = CategoriesResponse.fromJson(jsonDecode(serverResponse.body));
    if(serverResponse.statusCode >=200 && serverResponse.statusCode < 300){
      return right(response.genres!);
    }else{
      return left(Failuer(response.message??Constants.defaultErrorMessage));
    }
  }catch(e){
    return left(Failuer(Constants.defaultErrorMessage));
  }
  }

}