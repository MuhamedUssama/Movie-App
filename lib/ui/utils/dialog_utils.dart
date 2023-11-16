import 'package:flutter/material.dart';
import 'package:movie_app/ui/utils/app_colors.dart';

 showLoading(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return const AlertDialog(
          content: Row(
            children: [
              Text(
                "Loading...",
                style: TextStyle(color: AppColors.primary),
              ),
              Spacer(),
              CircularProgressIndicator(),
            ],
          ),
        );
      });
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}

void showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text(
            "Error",
            style: TextStyle(color: AppColors.primary),
          ),
          content: Text(
            errorMessage,
            style: const TextStyle(color: AppColors.blackGrey),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Ok"))
          ],
        );
      });
}