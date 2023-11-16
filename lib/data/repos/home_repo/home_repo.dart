import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/model/failures.dart';
import 'package:movie_app/data/model/popular_responsses/popularResponses.dart';
import 'package:movie_app/data/model/recommended_responses/RecommendedResponses.dart';
import 'package:movie_app/data/model/releases_responses/ReleasesResponses.dart';
import 'package:movie_app/data/repos/home_repo/ds/home_online_ds.dart';
import 'package:movie_app/domain/repos/home_repo/ds/home_online_ds.dart';
import 'package:movie_app/domain/repos/home_repo/home_repo.dart';
import 'package:movie_app/ui/utils/constants.dart';
import 'package:movie_app/ui/utils/extensions.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo{
  Connectivity connectivity;
  HomeOnlineDS ds;
  HomeRepoImpl(this.connectivity , this.ds);


  @override
  Future<Either<Failuer, List<PopularResult>>> getPopular() async{
    if(await connectivity.isInternetConnective){
      return ds.getPopular();
    }else{
      return Left(Failuer(Constants.internetErrorMessage));
    }
  }

  @override
  Future<Either<Failuer, List<RecommendedResult>>> getRecommended() async{
    if(await connectivity.isInternetConnective){
      return ds.getRecommended();
    }else{
      return Left(Failuer(Constants.internetErrorMessage));
    }
  }

  @override
  Future<Either<Failuer, List<ReleasesResult>>> getReleases() async{
    if(await connectivity.isInternetConnective){
      return ds.getReleases();
    }else{
      return Left(Failuer(Constants.internetErrorMessage));
    }
  }


}