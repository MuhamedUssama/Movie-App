// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repos/category_repo/category_repo.dart' as _i28;
import '../../data/repos/category_repo/ds/category_name_ds.dart' as _i4;
import '../../data/repos/details_repo/details_repo.dart' as _i9;
import '../../data/repos/details_repo/ds/details_online_ds.dart' as _i7;
import '../../data/repos/home_repo/ds/home_online_ds.dart' as _i12;
import '../../data/repos/home_repo/home_repo.dart' as _i14;
import '../../data/repos/movies_of_category_repo/ds/movies_of_category_online_ds.dart'
    as _i16;
import '../../data/repos/movies_of_category_repo/movies_of_category_repo.dart'
    as _i18;
import '../../data/repos/search_repo/ds/search_online_ds.dart' as _i22;
import '../../data/repos/search_repo/search_repo.dart' as _i24;
import '../../ui/screens/film_details/film_details_view_model.dart' as _i29;
import '../../ui/screens/main/main_view_model.dart' as _i34;
import '../../ui/screens/main/tabs/browes/browse_view_model.dart' as _i37;
import '../../ui/screens/main/tabs/browes/movies_of_category/movies_of_category_view_model.dart'
    as _i20;
import '../../ui/screens/main/tabs/home/home_view_model.dart' as _i33;
import '../../ui/screens/main/tabs/search/search_view_model.dart' as _i35;
import '../repos/category_repo/category_repo.dart' as _i27;
import '../repos/category_repo/ds/category_name_ds.dart' as _i3;
import '../repos/details_repo/details_repo.dart' as _i8;
import '../repos/details_repo/ds/details_online_ds.dart' as _i6;
import '../repos/home_repo/ds/home_online_ds.dart' as _i11;
import '../repos/home_repo/home_repo.dart' as _i13;
import '../repos/movies_of_category_repo/ds/movies_of_category_online_ds.dart'
    as _i15;
import '../repos/movies_of_category_repo/movies_of_category_repo.dart' as _i17;
import '../repos/search_repo/ds/search_online_ds.dart' as _i21;
import '../repos/search_repo/search_repo.dart' as _i23;
import '../use_case/brose_use_cases/get_categories_name_use_case.dart' as _i36;
import '../use_case/details_use_cases/get_details_use_case.dart' as _i10;
import '../use_case/details_use_cases/get_similar_movies.dart' as _i25;
import '../use_case/home_use_cases/get_popular_use_case.dart' as _i30;
import '../use_case/home_use_cases/get_recommended_use_case.dart' as _i31;
import '../use_case/home_use_cases/get_release_use_case.dart' as _i32;
import '../use_case/movies_of_category_use_case/movies_of_category_use_case.dart'
    as _i19;
import '../use_case/search_use_cases/get_list_of_searching.dart' as _i26;
import 'app_module.dart' as _i38;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.CategoriesOnlineDS>(() => _i4.CategoriesOnlineDSImpl());
    gh.factory<_i5.Connectivity>(() => appModule.getConnectivity());
    gh.factory<_i6.DetailsOnlineDS>(() => _i7.DetailsOnlineDSImpl());
    gh.factory<_i8.DetailsRepo>(() => _i9.DetailsRepoImpl(
          gh<_i5.Connectivity>(),
          gh<_i6.DetailsOnlineDS>(),
        ));
    gh.factory<_i10.DetailsUseCase>(
        () => _i10.DetailsUseCase(gh<_i8.DetailsRepo>()));
    gh.factory<_i11.HomeOnlineDS>(() => _i12.HomeOnlineDSImpl());
    gh.factory<_i13.HomeRepo>(() => _i14.HomeRepoImpl(
          gh<_i5.Connectivity>(),
          gh<_i11.HomeOnlineDS>(),
        ));
    gh.factory<_i15.MoviesOfCategoryOnlineDS>(
        () => _i16.MoviesOfCategoryOnlineDSImpl());
    gh.factory<_i17.MoviesOfCategoryRepo>(() => _i18.MoviesOfCategoryRepoImpl(
          gh<_i5.Connectivity>(),
          gh<_i15.MoviesOfCategoryOnlineDS>(),
        ));
    gh.factory<_i19.MoviesOfCategoryUseCase>(
        () => _i19.MoviesOfCategoryUseCase(gh<_i17.MoviesOfCategoryRepo>()));
    gh.factory<_i20.MoviesOfCategoryViewModel>(() =>
        _i20.MoviesOfCategoryViewModel(gh<_i19.MoviesOfCategoryUseCase>()));
    gh.factory<_i21.SearchOnlineDS>(() => _i22.SearchOnlineDSImpl());
    gh.factory<_i23.SearchRepo>(() => _i24.SearchRepoImpl(
          gh<_i5.Connectivity>(),
          gh<_i21.SearchOnlineDS>(),
        ));
    gh.factory<_i25.SimilarMoviesUseCase>(
        () => _i25.SimilarMoviesUseCase(gh<_i8.DetailsRepo>()));
    gh.factory<_i26.getListOfSearchingUseCase>(
        () => _i26.getListOfSearchingUseCase(gh<_i23.SearchRepo>()));
    gh.factory<_i27.CategoryRepo>(() => _i28.CategoryRepoImpl(
          gh<_i5.Connectivity>(),
          gh<_i3.CategoriesOnlineDS>(),
        ));
    gh.factory<_i29.FilmDetailsViewModel>(() => _i29.FilmDetailsViewModel(
          gh<_i10.DetailsUseCase>(),
          gh<_i25.SimilarMoviesUseCase>(),
        ));
    gh.factory<_i30.GetPopularUseCase>(
        () => _i30.GetPopularUseCase(gh<_i13.HomeRepo>()));
    gh.factory<_i31.GetRecommendedUseCase>(
        () => _i31.GetRecommendedUseCase(gh<_i13.HomeRepo>()));
    gh.factory<_i32.GetReleasesUseCase>(
        () => _i32.GetReleasesUseCase(gh<_i13.HomeRepo>()));
    gh.factory<_i33.HomeViewModel>(() => _i33.HomeViewModel(
          gh<_i30.GetPopularUseCase>(),
          gh<_i32.GetReleasesUseCase>(),
          gh<_i31.GetRecommendedUseCase>(),
        ));
    gh.factory<_i34.MainViewModel>(() => _i34.MainViewModel(
          gh<_i30.GetPopularUseCase>(),
          gh<_i31.GetRecommendedUseCase>(),
          gh<_i32.GetReleasesUseCase>(),
        ));
    gh.factory<_i35.SearchViewModel>(
        () => _i35.SearchViewModel(gh<_i26.getListOfSearchingUseCase>()));
    gh.factory<_i36.CategoriesNameUseCase>(
        () => _i36.CategoriesNameUseCase(gh<_i27.CategoryRepo>()));
    gh.factory<_i37.BrowseViewModel>(
        () => _i37.BrowseViewModel(gh<_i36.CategoriesNameUseCase>()));
    return this;
  }
}

class _$AppModule extends _i38.AppModule {}
