import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/use_case/brose_use_cases/get_categories_name_use_case.dart';
import 'package:movie_app/ui/utils/base_request_states.dart';


@injectable
class BrowseViewModel extends Cubit{
  CategoriesNameUseCase categoriesNameUseCase;
  BrowseViewModel(this.categoriesNameUseCase):super(BaseRequestInitialState());

  getCategoriesName(){
    return categoriesNameUseCase.execute();
  }

}