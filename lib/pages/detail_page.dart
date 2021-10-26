import 'package:cozy/models/space.dart';
import 'package:cozy/pages/error_page.dart';
import 'package:cozy/theme.dart';
import 'package:cozy/widgets/facility_item.dart';
import 'package:cozy/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:photo_view/photo_view.dart';

class DetailPage extends StatefulWidget {
  final Space space;
  DetailPage({required this.space});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ErrorPage()));
      }
    }

    Future<void> showConfirmation() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                      'Hubungi owner sekarang?',
                      style: blackTextStyle.copyWith(fontSize: 18),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    'Hubungi',
                    style: regularTextStyle.copyWith(color: primaryColor),
                  ),
                  onPressed: () {
                    launchUrl("tel: +${widget.space.phone}");
                  },
                ),
                TextButton(
                  child: Text(
                    'Batal',
                    style: regularTextStyle.copyWith(color: greyColor),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }

    Future<void> showImage(String imageUrl) async {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              backgroundColor: Colors.transparent,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: PhotoView(
                    backgroundDecoration:
                        BoxDecoration(color: Colors.transparent),
                    tightMode: true,
                    imageProvider: NetworkImage(imageUrl),
                  )),
            );
          });
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Image.network(
                widget.space.imageUrl,
                width: MediaQuery.of(context).size.width,
                height: 350,
                fit: BoxFit.cover,
              ),
              ListView(
                children: [
                  SizedBox(
                    height: 328,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        //NOTE: SPACE TITLE
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.space.name,
                                    style:
                                        blackTextStyle.copyWith(fontSize: 22),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text.rich(TextSpan(
                                      text: "\$${widget.space.price}",
                                      style: purpleTextStyle.copyWith(
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                          text: "/ month",
                                          style: greyTextStyle.copyWith(
                                              fontSize: 16),
                                        )
                                      ])),
                                ],
                              ),
                              Row(
                                  children: [1, 2, 3, 4, 5].map((index) {
                                return Container(
                                  margin: EdgeInsets.only(left: 2),
                                  child: RatingItem(
                                      rating: widget.space.rating,
                                      index: index),
                                );
                              }).toList())
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        //NOTE: MAIN FACILITIES
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: margin),
                          child: Text(
                            "Main Facilities",
                            style: blackTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: margin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FacilityItem(
                                  name: "Kitchen",
                                  imageUrl:
                                      "assets/images/Details/001-bar-counter.png",
                                  total: widget.space.numberOfKitchens,
                                ),
                                FacilityItem(
                                  name: "Bedroom",
                                  imageUrl:
                                      "assets/images/Details/002-double-bed.png",
                                  total: widget.space.numberOfBedrooms,
                                ),
                                FacilityItem(
                                  name: "Cupboard",
                                  imageUrl:
                                      "assets/images/Details/003-cupboard.png",
                                  total: widget.space.numberOfCupboards,
                                ),
                              ],
                            )),
                        //NOTE: PHOTOS
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: margin),
                          child: Text(
                            "Photos",
                            style: blackTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          height: 88,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: widget.space.photos.map((item) {
                                return InkWell(
                                  onTap: () {
                                    showImage(item);
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(left: 12),
                                      width: 110,
                                      height: 88,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                        child: Image.network(
                                          item,
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                );
                              }).toList()),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        //NOTE: LOCATION
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: margin),
                          child: Text(
                            "Location",
                            style: blackTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.space.address,
                                    style: regularTextStyle.copyWith(
                                        fontSize: 14, color: greyColor),
                                  ),
                                  Text(
                                    "${widget.space.city}, ${widget.space.country}",
                                    style: regularTextStyle.copyWith(
                                        fontSize: 14, color: greyColor),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  launchUrl(widget.space.mapUrl);
                                },
                                child: Image.asset(
                                  "assets/images/Icons/btn_location.png",
                                  width: 40,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width -
                                  (2 * margin),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: primaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(17))),
                                  child: Text(
                                    "Book now",
                                    style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  onPressed: () {
                                    showConfirmation();
                                  })),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "assets/images/Icons/btn_back.png",
                        width: 40,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isClicked = !isClicked;
                        });
                      },
                      child: Image.asset(
                        isClicked
                            ? "assets/images/Icons/btn_wishlist_filled.png"
                            : "assets/images/Icons/btn_wishlist.png",
                        width: 40,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
