import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/model/movies_of_category/MoviesOfCategoryResponse.dart';
import 'package:movie_app/domain/di/di.dart';
import 'package:movie_app/ui/screens/film_details/film_details.dart';
import 'package:movie_app/ui/screens/main/tabs/browes/movies_of_category/movies_of_category_view_model.dart';
import 'package:movie_app/ui/utils/app_assets.dart';
import 'package:movie_app/ui/utils/app_colors.dart';
import 'package:movie_app/ui/utils/base_request_states.dart';
import 'package:movie_app/ui/utils/error_view.dart';
import 'package:movie_app/ui/widgets/loading_widget.dart';

class MoviesOfCategory extends StatefulWidget {

  String categoryID;
  String categoryName;

   MoviesOfCategory({super.key, required this.categoryID , required this.categoryName});

  @override
  State<MoviesOfCategory> createState() => _MoviesOfCategoryState();
}

class _MoviesOfCategoryState extends State<MoviesOfCategory> {
  MoviesOfCategoryViewModel viewModel = getIt();

  @override
  void initState() {
    viewModel.getMovies(widget.categoryID);
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .08,),
          Text(
            "${widget.categoryName} Movies",
            style: TextStyle(
              color: AppColors.accent,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .04,),
          BlocBuilder(
            bloc: viewModel.moviesOfCategoryUseCase,
            builder: (context, state) {
              if(state is BaseRequestSuccessState){
                return buildListView(context, state.data);
              }else if(state is BaseRequestErrorState){
                return ErrorView(message: state.message);
              }else{
                return const LoadingWidget();
              }
            },
          ),
        ],
      ),
    );
  }

  // Expanded(
  Widget buildListView(BuildContext context , List<MoviesResults> move) => Expanded(
    child: ListView.separated(
        itemBuilder: (context, index) =>SizedBox(
          width: MediaQuery.of(context).size.width * .8,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context) => FilmDetailsScreen("" )
                ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl:move[index].backdropPath ??AppAssets.notFoundImage,
                      errorWidget: (_, __, ___) => Image.asset(
                        AppAssets.imageTest,
                        height: MediaQuery.of(context).size.height * .1,
                        width: MediaQuery.of(context).size.width * .3,
                        fit: BoxFit.cover,
                      ),
                      progressIndicatorBuilder: (_, __, progress) => Center(
                          child: CircularProgressIndicator(value: progress.progress,)),
                      height: MediaQuery.of(context).size.height * .1,
                      width: MediaQuery.of(context).size.width * .4,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12,),
                   Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          move[index].originalTitle! ,
                          style: TextStyle(
                            color: AppColors.white ,
                            fontSize: 18,
                          ),
                          maxLines: 1,
                        ),
                        SizedBox(height: 4,),
                        Text(
                          move[index].releaseDate! ,
                          style: TextStyle(
                            color: AppColors.grey ,
                            fontSize: 10,
                          ),
                          maxLines: 1,
                        ),
                        SizedBox(height: 4,),
                        Text(
                          move[index].overview! ,
                          style: TextStyle(
                            color: AppColors.grey ,
                            fontSize: 13,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => Container(height: 1,width:MediaQuery.of(context).size.width * .8, color: AppColors.grey,),
        itemCount: move.length
    ),
  );
}
