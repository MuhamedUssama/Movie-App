import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/model/failures.dart';
import 'package:movie_app/data/model/search_responses/SearchResponses.dart';
import 'package:movie_app/domain/repos/search_repo/search_repo.dart';
import 'package:movie_app/ui/utils/base_request_states.dart';

@injectable
class getListOfSearchingUseCase extends Cubit{

  SearchRepo repo;

  getListOfSearchingUseCase(this.repo):super(BaseRequestInitialState());

  void execute(String text)async{

    Either<Failuer, List<SearchResult>> either = await repo.getListOfSearching(text);

    return either.fold(
            (error) => emit(BaseRequestErrorState(error.errorMessage)),
            (list) => emit(BaseRequestSuccessState<List<SearchResult>>(data: list)));
  }




}