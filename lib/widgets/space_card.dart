import 'package:cozy/models/space.dart';
import 'package:cozy/pages/detail_page.dart';
import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';

class SpaceCard extends StatelessWidget {
  Space space;
  SpaceCard(this.space);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      space: space,
                    )));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 130,
              height: 110,
              child: Stack(
                children: [
                  Image.network(
                    space.imageUrl,
                    width: 130,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30))),
                      width: 70,
                      height: 30,
                      child: Row(children: [
                        SizedBox(
                          width: 16,
                        ),
                        Image.asset(
                          "assets/images/Icons/Icon_star_solid.png",
                          width: 18,
                          height: 18,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "${space.rating}/5",
                          style: whiteTextStyle.copyWith(fontSize: 13),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                space.name,
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              Text.rich(TextSpan(
                  text: "\$${space.price.toString()}",
                  style: purpleTextStyle.copyWith(fontSize: 16),
                  children: [
                    TextSpan(
                      text: "/ month",
                      style: greyTextStyle.copyWith(fontSize: 16),
                    )
                  ])),
              SizedBox(
                height: 16,
              ),
              Text("${space.city}, ${space.country}")
            ],
          )
        ],
      ),
    );
  }
}
