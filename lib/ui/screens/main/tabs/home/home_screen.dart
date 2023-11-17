import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/model/popular_responsses/popularResponses.dart';
import 'package:movie_app/data/model/recommended_responses/RecommendedResponses.dart';
import 'package:movie_app/data/model/releases_responses/ReleasesResponses.dart';
import 'package:movie_app/domain/di/di.dart';
import 'package:movie_app/ui/screens/main/tabs/home/home_view_model.dart';
import 'package:movie_app/ui/utils/app_assets.dart';
import 'package:movie_app/ui/utils/app_colors.dart';
import 'package:movie_app/ui/utils/base_request_states.dart';
import 'package:movie_app/ui/utils/error_view.dart';
import 'package:movie_app/ui/widgets/card_of_film.dart';
import 'package:movie_app/ui/widgets/loading_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel viewModel = getIt();

  @override
  void initState() {
    viewModel.getPopular();
    viewModel.getReleases();
    viewModel.getRecommended();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //buildPopularWidget(result),
          BlocBuilder(
            bloc: viewModel.getPopularUseCase,
            builder: (context, state) {
              print(state);
              if (state is BaseRequestSuccessState) {
                return buildPopularWidget(state.data);
              } else if (state is BaseRequestErrorState) {
                return ErrorView(message: state.message);
              } else {
                return SizedBox(
                    height: MediaQuery.of(context).size.height * .35,
                    child: Center(child: LoadingWidget()));
              }
            },
          ),
          const SizedBox(
            height: 24,
          ),
          buildNewReleasesList(),
          const SizedBox(
            height: 30,
          ),
          buildRecommendedList(),
        ],
      ),
    );
  }

  Widget buildPopularWidget(List<PopularResult>? result) => CarouselSlider(
        items: result!.map((move) {
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network(
                    move.backdropPath ?? AppAssets.imageTest,
                    height: MediaQuery.of(context).size.height * .24,
                    fit: BoxFit.fitWidth,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 5,
                      top: 12,
                      right: 10,
                      left: MediaQuery.of(context).size.width * .36,
                    ),
                    child: Text(
                      move.originalTitle!,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 10,
                      top: 5,
                      right: 10,
                      left: MediaQuery.of(context).size.width * .36,
                    ),
                    child: Text(
                      move.releaseDate!,
                      style: const TextStyle(
                        color: AppColors.grey,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 21.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: cardImageOfFilm(
                    context: context,
                    imagePath: move.posterPath!,
                    moveID: move.id!,
                  ),
                ),
              ),
            ],
          );
        }).toList(),
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * .34,
          aspectRatio: 16 / 9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.ease,
        ),
      );

  //List<ReleasesResult>? result
  Widget buildNewReleasesList() => Container(
        height: MediaQuery.of(context).size.height * .25,
        color: AppColors.backgroundList,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 22.0,
          ),
          child: BlocBuilder(
            bloc: viewModel.getReleasesUseCase,
            builder: (context, state) {
              if (state is BaseRequestSuccessState) {
                List<ReleasesResult>? result = state.data;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 13,
                    ),
                    const Text(
                      "New Releases",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .18,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => cardImageOfFilm(
                            context: context,
                            imagePath:
                                result[index].posterPath ?? AppAssets.imageTest,
                            moveID: result[index].id!),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 14,
                        ),
                        itemCount: result!.length,
                      ),
                    ),
                  ],
                );
              } else if (state is BaseRequestErrorState) {
                return ErrorView(message: state.message);
              } else {
                return const Center(child: LoadingWidget());
              }
            },
          ),
        ),
      );

  //List<RecommendedResult> result
  Widget buildRecommendedList() => Container(
        height: MediaQuery.of(context).size.height * .34,
        color: AppColors.backgroundList,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 22.0,
          ),
          child: BlocBuilder(
            bloc: viewModel.getRecommendedUseCase,
            builder: (context, state) {
              if (state is BaseRequestSuccessState) {
                List<RecommendedResult> result = state.data;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 13,
                    ),
                    const Text(
                      "Recommended",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .27,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Column(
                          children: [
                            cardImageOfFilm(
                                context: context,
                                imagePath: result[index].posterPath ??
                                    AppAssets.imageTest,
                                withDetails: true,
                                moveID: result[index].id!),
                            Container(
                              height: MediaQuery.of(context).size.height * .09,
                              width: MediaQuery.of(context).size.width * .26,
                              color: AppColors.blackGrey,
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: AppColors.accent,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "${result[index].voteAverage!}",
                                        style: const TextStyle(
                                            color: AppColors.white,
                                            fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    result[index].originalTitle!,
                                    style: const TextStyle(
                                        color: AppColors.white, fontSize: 10),
                                    maxLines: 1,
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    result[index].releaseDate!,
                                    style: const TextStyle(
                                        color: AppColors.grey, fontSize: 10),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 14,
                        ),
                        itemCount: result.length,
                      ),
                    ),
                  ],
                );
              } else if (state is BaseRequestErrorState) {
                return ErrorView(message: state.message);
              } else {
                return const Center(child: LoadingWidget());
              }
            },
          ),
        ),
      );
}
