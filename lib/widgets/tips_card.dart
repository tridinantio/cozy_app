import 'package:cozy/models/tips.dart';
import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;
  TipsCard(this.tips);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 321,
        height: 80,
        child: Row(
          children: [
            Container(width: 80, child: Image.asset(tips.imageUrl)),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tips.title,
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Updated" + tips.updatedAt,
                  style: greyTextStyle.copyWith(fontSize: 14),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.chevron_right,
                color: greyColor,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
