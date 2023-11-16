import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/model/failures.dart';
import 'package:movie_app/data/model/simillar_responses/SimillarResponses.dart';
import 'package:movie_app/domain/repos/details_repo/details_repo.dart';
import 'package:movie_app/ui/utils/base_request_states.dart';

@injectable
class SimilarMoviesUseCase extends Cubit{
  DetailsRepo repo;
  SimilarMoviesUseCase(this.repo):super(BaseRequestInitialState());

  void execute(String moveID)async{
    Either<Failuer,List<SimilarResult>> either = await repo.getSimilarMovie(moveID);

    either.fold(
            (failure) => emit(BaseRequestErrorState(failure.errorMessage)),
            (list) => emit(BaseRequestSuccessState<List<SimilarResult>>(data:list)),
    );
  }

}