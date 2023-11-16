import 'package:flutter/material.dart';
import 'package:movie_app/ui/screens/main/tabs/browes/movies_of_category/movies_of_category.dart';
import 'package:movie_app/ui/utils/app_assets.dart';

import '../utils/app_colors.dart';

class CategoriesWidget extends StatelessWidget {

  String categoryName;
  String categoryId;
  BuildContext context;

  final Radius radius = const Radius.circular(24);

   CategoriesWidget({super.key,required this.context,required this.categoryName , required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder:(context) => MoviesOfCategory(categoryName: categoryName,categoryID:categoryId,) )
        );
      },
      child: Stack(
        alignment:AlignmentDirectional.center ,
        children: [
          Image.asset(
              AppAssets.movieBackGround,
            height: MediaQuery.of(context).size.height * .2,
            width: MediaQuery.of(context).size.width * .4,
            fit: BoxFit.fitWidth,
          ),
          Text(
            categoryName,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
