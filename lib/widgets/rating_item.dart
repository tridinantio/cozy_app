import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int rating, index;
  RatingItem({required this.rating, required this.index});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      index <= rating
          ? "assets/images/Icons/Icon_star_solid.png"
          : "assets/images/Icons/Icon_star_grey.png",
      width: 20,
    );
  }
}
