import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/ui/screens/film_details/film_details.dart';
import 'package:movie_app/ui/utils/app_assets.dart';
import 'package:movie_app/ui/utils/app_colors.dart';

Widget cardImageOfFilm({
  required BuildContext context ,
  required String imagePath ,
  bool withDetails = false ,
  required int moveID,
  double heightOfImage = 0,
  double widthOfImage = 0,
  double heightOfTicket = 0,
  double widthOfTicket = 0,
  bool inDetails = false,
}) => InkWell(
  onTap: (){
    if(inDetails ==false){
      Navigator.push(
          context,
          MaterialPageRoute(builder:(context) => FilmDetailsScreen("$moveID") )
      );
    }
  },
  child:   Stack(
    children: [

      ClipRRect(

        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(10) ,
          topEnd: Radius.circular(10) ,
          bottomStart:withDetails? Radius.zero: Radius.circular(10) ,
          bottomEnd:withDetails? Radius.zero: Radius.circular(10) ,
        ),

        child: CachedNetworkImage(
          imageUrl: imagePath,
          errorWidget: (_, __, ___) => Image.asset(
            AppAssets.imageTest,
            height: MediaQuery.of(context).size.height * .1,
            width: MediaQuery.of(context).size.width * .4,
            fit: BoxFit.cover,
          ),
          height: heightOfImage ==0? MediaQuery.of(context).size.height * .18 : heightOfImage,
          width: widthOfImage==0? MediaQuery.of(context).size.width * .26 : widthOfImage,
          fit: BoxFit.cover,
        ),

      ),

      Container(

        height: heightOfTicket==0? MediaQuery.of(context).size.height * .064 : heightOfTicket,

        width: widthOfTicket==0? MediaQuery.of(context).size.width * .09 : widthOfTicket,

        decoration: BoxDecoration(

          color:Colors.grey.withOpacity(.7),

          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),

        ),

        child: Center(

          child: Icon(

            Icons.add ,color: AppColors.white,size: MediaQuery.of(context).size.width * .08,

          ),

        ),

      ),

    ],

  ),
);