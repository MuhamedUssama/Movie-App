import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/model/failures.dart';
import 'package:movie_app/data/model/movies_of_category/MoviesOfCategoryResponse.dart';
import 'package:movie_app/domain/repos/movies_of_category_repo/movies_of_category_repo.dart';
import 'package:movie_app/ui/utils/base_request_states.dart';

@injectable
class MoviesOfCategoryUseCase extends Cubit{
  MoviesOfCategoryRepo repo;

  MoviesOfCategoryUseCase(this.repo):super(BaseRequestInitialState());

  void execute(String categoryName)async{
    Either<Failuer,List<MoviesResults>> either = await repo.getMovies(categoryName);

    either.fold(
            (failure) =>emit(BaseRequestErrorState(failure.errorMessage)) ,
            (list) => emit(BaseRequestSuccessState<List<MoviesResults>>(data: list))
    );

  }


}