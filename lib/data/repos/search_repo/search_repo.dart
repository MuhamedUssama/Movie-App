import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/model/failures.dart';
import 'package:movie_app/data/model/search_responses/SearchResponses.dart';
import 'package:movie_app/domain/repos/search_repo/ds/search_online_ds.dart';
import 'package:movie_app/domain/repos/search_repo/search_repo.dart';
import 'package:movie_app/ui/utils/constants.dart';
import 'package:movie_app/ui/utils/extensions.dart';


@Injectable(as: SearchRepo )
class SearchRepoImpl extends SearchRepo{
  Connectivity connectivity;
  SearchOnlineDS ds;

  SearchRepoImpl( this.connectivity , this.ds);
  @override
  Future<Either<Failuer, List<SearchResult>>> getListOfSearching(String text) async{
    if(await connectivity.isInternetConnective){
      return ds.getListOfSearching(text);
    }else{
      return Left(Failuer(Constants.internetErrorMessage));
    }
  }

}