import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/use_case/movies_of_category_use_case/movies_of_category_use_case.dart';
import 'package:movie_app/ui/utils/base_request_states.dart';

@injectable
class MoviesOfCategoryViewModel extends Cubit{
  MoviesOfCategoryUseCase moviesOfCategoryUseCase;

  MoviesOfCategoryViewModel(this.moviesOfCategoryUseCase):super(BaseRequestInitialState());

  getMovies(String categoryName){
    return moviesOfCategoryUseCase.execute(categoryName);
  }


}