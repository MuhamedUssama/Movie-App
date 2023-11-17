import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/model/categories_name_responses/Genres.dart';
import 'package:movie_app/domain/di/di.dart';
import 'package:movie_app/ui/screens/main/tabs/browes/browse_view_model.dart';
import 'package:movie_app/ui/utils/app_colors.dart';
import 'package:movie_app/ui/utils/base_request_states.dart';
import 'package:movie_app/ui/utils/error_view.dart';
import 'package:movie_app/ui/widgets/categoryWidget.dart';
import 'package:movie_app/ui/widgets/loading_widget.dart';

class BrowesScreen extends StatefulWidget {
  const BrowesScreen({super.key});

  @override
  State<BrowesScreen> createState() => _BrowesScreenState();
}

class _BrowesScreenState extends State<BrowesScreen> {
  BrowseViewModel viewModel = getIt();
  @override
  void initState() {
    super.initState();
    viewModel.getCategoriesName();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .08,
          ),
          const Text(
            "   Browse Category",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          BlocBuilder(
            bloc: viewModel.categoriesNameUseCase,
            builder: (context, state) {
              if (state is BaseRequestSuccessState) {
                return buildListOfCategories(state.data);
              } else if (state is BaseRequestErrorState) {
                return ErrorView(message: state.message);
              } else {
                return SizedBox(
                    height: MediaQuery.of(context).size.height * .35,
                    child: const Center(child: LoadingWidget()));
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildListOfCategories(List<CategoryGenres> list) => Expanded(
        child: GridView.builder(
          itemCount: list.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) => CategoriesWidget(
              context: context,
              categoryName: list[index].name!,
              categoryId: "${list[index].id!}"),
        ),
      );
}
