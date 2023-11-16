import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/use_case/details_use_cases/get_details_use_case.dart';
import 'package:movie_app/domain/use_case/details_use_cases/get_similar_movies.dart';
import 'package:movie_app/ui/utils/base_request_states.dart';

@injectable
class FilmDetailsViewModel extends Cubit{
  DetailsUseCase detailsUseCase;
  SimilarMoviesUseCase similarUseCase;

  FilmDetailsViewModel(this.detailsUseCase , this.similarUseCase):super(BaseRequestInitialState());

  getDetails(String moveID){
    return detailsUseCase.execute(moveID);
  }

  getSimilarMovies(String moveID){
    return similarUseCase.execute(moveID);
  }


}