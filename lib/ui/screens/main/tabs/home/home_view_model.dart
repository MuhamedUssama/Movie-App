import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/use_case/home_use_cases/get_popular_use_case.dart';
import 'package:movie_app/domain/use_case/home_use_cases/get_recommended_use_case.dart';
import 'package:movie_app/domain/use_case/home_use_cases/get_release_use_case.dart';
import 'package:movie_app/ui/utils/base_request_states.dart';

@injectable
class HomeViewModel extends Cubit{

  GetPopularUseCase getPopularUseCase;
  GetReleasesUseCase getReleasesUseCase;
  GetRecommendedUseCase getRecommendedUseCase;

  HomeViewModel(
      this.getPopularUseCase,
      this.getReleasesUseCase,
      this.getRecommendedUseCase,
      ):super(BaseRequestInitialState());

  getPopular(){
    getPopularUseCase.execute();
  }

  getReleases(){
    getReleasesUseCase.execute();
  }

  getRecommended(){
    getRecommendedUseCase.execute();
  }


}