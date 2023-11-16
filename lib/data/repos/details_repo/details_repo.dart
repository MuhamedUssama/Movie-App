import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/model/details_responses/DetailsResponses.dart';
import 'package:movie_app/data/model/failures.dart';
import 'package:movie_app/data/model/simillar_responses/SimillarResponses.dart';
import 'package:movie_app/domain/repos/details_repo/details_repo.dart';
import 'package:movie_app/domain/repos/details_repo/ds/details_online_ds.dart';
import 'package:movie_app/ui/utils/constants.dart';
import 'package:movie_app/ui/utils/extensions.dart';

@Injectable(as: DetailsRepo)
class DetailsRepoImpl extends DetailsRepo {
  Connectivity connectivity;
  DetailsOnlineDS ds;

  DetailsRepoImpl(this.connectivity,this.ds);

  @override
  Future<Either<Failuer, DetailsResponses>> getDetails(String moveID) async{
    if(await connectivity.isInternetConnective){
      return ds.getDetails(moveID);
    }else{
      return left(Failuer(Constants.internetErrorMessage));
    }
  }

  @override
  Future<Either<Failuer, List<SimilarResult>>> getSimilarMovie(String moveID) async{
    if(await connectivity.isInternetConnective){
      return ds.getSimilarMovie(moveID);
    }else{
      return left(Failuer(Constants.internetErrorMessage));
    }
  }

}