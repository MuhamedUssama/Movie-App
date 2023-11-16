import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/model/failures.dart';
import 'package:movie_app/data/model/releases_responses/ReleasesResponses.dart';
import 'package:movie_app/domain/repos/home_repo/home_repo.dart';
import 'package:movie_app/ui/utils/base_request_states.dart';


@injectable
class GetReleasesUseCase extends Cubit{
  HomeRepo repo;
  GetReleasesUseCase(this.repo): super(BaseRequestInitialState());

  void execute() async{
    Either<Failuer ,List<ReleasesResult>> either = await repo.getReleases();

    return either.fold(
            (failure) => emit(BaseRequestErrorState(failure.errorMessage)),
            (list) => emit(BaseRequestSuccessState<List<ReleasesResult>>(data: list)));

  }



}