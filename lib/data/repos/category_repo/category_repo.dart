import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/model/categories_name_responses/Genres.dart';
import 'package:movie_app/data/model/failures.dart';
import 'package:movie_app/domain/repos/category_repo/category_repo.dart';
import 'package:movie_app/domain/repos/category_repo/ds/category_name_ds.dart';
import 'package:movie_app/ui/utils/constants.dart';
import 'package:movie_app/ui/utils/extensions.dart';

@Injectable(as: CategoryRepo)
class CategoryRepoImpl extends CategoryRepo{
 Connectivity connectivity;
 CategoriesOnlineDS ds;

 CategoryRepoImpl(this.connectivity,this.ds);

  @override
  Future<Either<Failuer, List<CategoryGenres>>> getCategoriesName()async{
   if(await connectivity.isInternetConnective){
    return ds.getCategoriesName();
   }else{
    return left(Failuer(Constants.internetErrorMessage));
   }
  }}