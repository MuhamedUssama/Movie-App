import 'package:flutter/material.dart';
import 'package:movie_app/ui/utils/app_colors.dart';


Widget TffOfSearch({
  required BuildContext context,
  required TextEditingController controller,
  required ValueChanged<String> function(text),
}) => TextFormField(
controller: controller,
onChanged: function,
decoration:  InputDecoration(
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(50),
borderSide: BorderSide(color: AppColors.grey,width: 2),
),
focusedBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(50),
borderSide: BorderSide(color: AppColors.primary,width: 2)
),
filled: true,
fillColor:AppColors.white,
suffix: const Icon(
Icons.search_rounded ,
color: AppColors.primary),
prefixIcon: IconButton(
onPressed: (){
// controller.text = "";
// setState(() {});
},
icon: Icon(Icons.clear_outlined , color: AppColors.primary, size: 30),
),
hintText: "Search Article",
hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.blackGrey),
border: InputBorder.none,
),
cursorColor: AppColors.primary,
cursorHeight: 20,
style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.primary , fontSize: 20),

);