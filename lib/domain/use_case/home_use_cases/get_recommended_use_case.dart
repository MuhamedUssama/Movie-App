import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/model/failures.dart';
import 'package:movie_app/data/model/recommended_responses/RecommendedResponses.dart';
import 'package:movie_app/domain/repos/home_repo/home_repo.dart';
import 'package:movie_app/ui/utils/base_request_states.dart';

@injectable
class GetRecommendedUseCase extends Cubit{
  HomeRepo repo;
  GetRecommendedUseCase(this.repo): super(BaseRequestInitialState());

  void execute() async{
    Either<Failuer ,List<RecommendedResult>> either = await repo.getRecommended();

    return either.fold(
            (failure) => emit(BaseRequestErrorState(failure.errorMessage)),
            (list) => emit(BaseRequestSuccessState<List<RecommendedResult>>(data: list)));

  }



}