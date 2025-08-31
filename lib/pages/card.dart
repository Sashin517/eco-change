import 'package:flutter/material.dart';
import '../colors.dart';


class CustomCard extends StatelessWidget {
  // final String imagePath;
  // final String title;
  // final String description;

  // const CustomCard({
  //   super.key,
  //   required this.imagePath,
  //   required this.title,
  //   required this.description,
  // });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 341, // give fixed width so cards don't shrink too much
      child: Card(
      color: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Today schedule vehicle has been broken sorry for your inconvenience, next trip will be updated soon",
                maxLines: 3,
                style: TextStyle(color: AppColors.text, fontSize: 14, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
              Spacer(), // 👈 pushes time text to bottom
              Align(
              alignment: Alignment.centerRight, // 👈 aligns text to right
              child: const Text(
                "6 hours ago",
                style: TextStyle(color: AppColors.text, fontSize: 12),
              ),
            ),
            ],
          ),
        ),
      ),

    );
  }
}