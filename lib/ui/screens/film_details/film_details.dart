import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/model/details_responses/DetailsResponses.dart';
import 'package:movie_app/data/model/simillar_responses/SimillarResponses.dart';
import 'package:movie_app/ui/utils/app_assets.dart';
import 'package:movie_app/ui/utils/app_colors.dart';
import 'package:movie_app/ui/widgets/card_of_film.dart';


class FilmDetailsScreen extends StatefulWidget {
  int moveID;
  FilmDetailsScreen(this.moveID, {super.key});

  @override
  State<FilmDetailsScreen> createState() => _FilmDetailsScreenState();
}

class _FilmDetailsScreenState extends State<FilmDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return  buildScreen();
  }
//DetailsResponses? details
  Widget buildScreen( ) => Scaffold(
    appBar: AppBar(
      backgroundColor: AppColors.blackGrey,
      title: Text(
       " details!.title!"
      ),
      centerTitle: true,
    ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: "details.backdropPath "?? "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png",
            errorWidget: (_, __, ___) => Image.asset(
              AppAssets.imageTest,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.width,
            ),
            progressIndicatorBuilder: (_, __, progress) => Center(
                child: CircularProgressIndicator(value: progress.progress,)),
            height: MediaQuery.of(context).size.height * .24,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 13,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "details.title!",
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 18
                  ),
                ),
                const SizedBox(height: 8,),
                Text(
                  "details.releaseDate!",
                  style: const TextStyle(
                      color: AppColors.grey,
                      fontSize: 10
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .24,
                  child: Row(
                    children: [
                      cardImageOfFilm(
                        context: context,
                        imagePath: "details.posterPath!",
                        moveID: 0,
                        heightOfImage: MediaQuery.of(context).size.height * .24,
                        widthOfImage: MediaQuery.of(context).size.width * .31,
                        heightOfTicket: MediaQuery.of(context).size.height * .05,
                        widthOfTicket: MediaQuery.of(context).size.width * .08,
                      ),
                      const SizedBox(width: 11,),
                      Expanded(
                          child: Column(
                            children: [
                              const Spacer(),
                              Text(
                                "details.overview!",
                                style:const TextStyle(
                                  fontSize: 13,
                                  color: AppColors.grey
                                ),
                                maxLines: 6,
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: AppColors.accent,size: 30,),
                                  const SizedBox(width: 10,),
                                  Text(
                                      "details.voteAverage!",
                                      style:const TextStyle(
                                          fontSize: 18,
                                          color: AppColors.white,
                                        fontWeight: FontWeight.bold
                                      ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                            ],
                          ),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 18,),
              ],
            ),
          ),
          buildMoreLikeList(),
        ],
      ),
    ),
  );

//List<SimilarResult> result
  Widget buildMoreLikeList() => Container(
    height: MediaQuery.of(context).size.height * .34,
    color: AppColors.backgroundList,
    child: Padding(
      padding: const EdgeInsets.only(left: 22.0 , ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 13,),
          const Text(
            "More Like This",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 13,),
          SizedBox(
            height: MediaQuery.of(context).size.height * .27,
            child: ListView.separated(

              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>Column(
                children: [
                  cardImageOfFilm(
                      context: context,
                      imagePath:" result[index].posterPath"??AppAssets.imageTest,
                      withDetails: true,
                      moveID: 0
                  ),
                  Container(
                    height:MediaQuery.of(context).size.height * .09,
                    width:  MediaQuery.of(context).size.width * .26,
                    color: AppColors.blackGrey,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.star , color: AppColors.accent , size: 20,),
                            SizedBox(width: 3,),
                            Text(
                              "{result[index].voteAverage!}",
                              style:const TextStyle(color: AppColors.white , fontSize: 10),
                            ),


                          ],
                        ),
                        const SizedBox(height: 3,),
                        Text(
                          "result[index].originalTitle!",
                          style:const TextStyle(color: AppColors.white , fontSize: 10),
                          maxLines: 1,
                        ),
                        const SizedBox(height: 3,),
                        Text(
                          "result[index].releaseDate!",
                          style:const TextStyle(color: AppColors.grey , fontSize: 10),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ) ,
              separatorBuilder: (context, index) => const SizedBox(width: 14,),
              itemCount: 10,
            ),
          ),
        ],
      ),
    ),
  );
}
