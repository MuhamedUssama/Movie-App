import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/model/details_responses/DetailsResponses.dart';
import 'package:movie_app/data/model/failures.dart';
import 'package:movie_app/domain/repos/details_repo/details_repo.dart';
import 'package:movie_app/ui/utils/base_request_states.dart';

@injectable
class DetailsUseCase extends Cubit{

  DetailsRepo repo;


  DetailsUseCase(this.repo):super(BaseRequestInitialState());

  void execute(String moveID)async{
    Either<Failuer,DetailsResponses> either = await repo.getDetails(moveID);

    either.fold(

            (failure) => emit(BaseRequestErrorState(failure.errorMessage)),
            (details) => emit(BaseRequestSuccessState<DetailsResponses>(data: details))
    );
  }


}