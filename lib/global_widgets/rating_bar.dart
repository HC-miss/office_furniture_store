import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:office_furniture_store/core/values/app_colors.dart';

class StarRatingBar extends StatelessWidget {
  final double score;
  final double itemSize;

  const StarRatingBar({
    super.key,
    required this.score,
    this.itemSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemPadding: EdgeInsets.zero,
      initialRating: score,
      itemSize: itemSize,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      glow: false, // 触摸时是否发光
      ignoreGestures: true, // 如果设置为 true，将禁用评级栏上的任何手势。
      itemBuilder: (context, _) => Icon(
        Icons.star,
        // size: 2.0,
        color: AppColors.lightOrange,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
