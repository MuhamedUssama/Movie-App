import 'package:flutter/material.dart';
import 'package:movie_app/ui/utils/app_colors.dart';

class ErrorView extends StatelessWidget {
  final String message;

  const ErrorView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message,style: TextStyle(
        color: AppColors.accent
      ),),
    );
  }
}