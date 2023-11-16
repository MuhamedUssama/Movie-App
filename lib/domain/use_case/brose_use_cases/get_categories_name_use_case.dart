import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/model/categories_name_responses/Genres.dart';
import 'package:movie_app/data/model/failures.dart';
import 'package:movie_app/domain/repos/category_repo/category_repo.dart';
import 'package:movie_app/ui/utils/base_request_states.dart';

@injectable
class CategoriesNameUseCase extends Cubit{
  CategoryRepo repo;

  CategoriesNameUseCase(this.repo):super(BaseRequestInitialState());

  void execute()async{
    Either<Failuer,List<CategoryGenres>> either = await repo.getCategoriesName();

    either.fold(
            (failure) => emit(BaseRequestErrorState(failure.errorMessage)),
            (list) => emit(BaseRequestSuccessState<List<CategoryGenres>>(data:list))
    );
  }
}