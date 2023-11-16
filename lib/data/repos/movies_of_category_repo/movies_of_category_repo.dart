import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/model/failures.dart';
import 'package:movie_app/data/model/movies_of_category/MoviesOfCategoryResponse.dart';
import 'package:movie_app/domain/repos/movies_of_category_repo/ds/movies_of_category_online_ds.dart';
import 'package:movie_app/domain/repos/movies_of_category_repo/movies_of_category_repo.dart';
import 'package:movie_app/ui/utils/constants.dart';
import 'package:movie_app/ui/utils/extensions.dart';

@Injectable(as:MoviesOfCategoryRepo )
class MoviesOfCategoryRepoImpl extends MoviesOfCategoryRepo{

  Connectivity connectivity;
  MoviesOfCategoryOnlineDS ds;

  MoviesOfCategoryRepoImpl(this.connectivity,this.ds);
  @override
  Future<Either<Failuer, List<MoviesResults>>> getMovies(String categoryName) async{
    if(await connectivity.isInternetConnective){
      return ds.getMovies(categoryName);
    } else{
      return left(Failuer(Constants.internetErrorMessage));
    }
  }


}