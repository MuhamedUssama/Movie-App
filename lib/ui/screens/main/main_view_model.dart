import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/use_case/home_use_cases/get_popular_use_case.dart';
import 'package:movie_app/domain/use_case/home_use_cases/get_recommended_use_case.dart';
import 'package:movie_app/domain/use_case/home_use_cases/get_release_use_case.dart';
import 'package:movie_app/ui/screens/main/tabs/browes/browse_screen.dart';
import 'package:movie_app/ui/screens/main/tabs/home/home_screen.dart';
import 'package:movie_app/ui/screens/main/tabs/search/search_screen.dart';


@injectable
class MainViewModel extends Cubit{
  int currentIndex = 0 ;
  GetPopularUseCase getPopularUseCase;
  GetReleasesUseCase getReleasesUseCase;
  GetRecommendedUseCase getRecommendedUseCase;

  List<Widget> tabs = [
    HomeScreen(),
    SearchScreen(),
    BrowesScreen(),
    SearchScreen(),
  ];

  MainViewModel(
      this.getPopularUseCase,
      this.getRecommendedUseCase,
      this.getReleasesUseCase
      ) : super(MainInitialState());

   set changeTabIndex(int index){

    currentIndex = index;
    emit(MainInitialState());
    print("done");
  }

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

class MainInitialState{}