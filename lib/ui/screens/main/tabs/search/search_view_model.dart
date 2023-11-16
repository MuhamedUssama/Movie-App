import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/model/search_responses/SearchResponses.dart';
import 'package:movie_app/domain/use_case/search_use_cases/get_list_of_searching.dart';
import 'package:movie_app/ui/utils/base_request_states.dart';
import 'package:movie_app/ui/utils/constants.dart';

@injectable
class SearchViewModel extends Cubit{

  TextEditingController controller = TextEditingController();
  getListOfSearchingUseCase useCase;

  SearchViewModel(this.useCase) : super(BaseRequestInitialState());

  getList(String text){
      useCase.execute(text);
  }


  set changeOfController(String text){
    controller.text = text;
    getList(text);
  }




}