import 'package:cozy/models/city.dart';
import 'package:cozy/models/space.dart';
import 'package:cozy/models/tips.dart';
import 'package:cozy/providers/space_provider.dart';
import 'package:cozy/theme.dart';
import 'package:cozy/widgets/bottom_navbar_item.dart';
import 'package:cozy/widgets/city_card.dart';
import 'package:cozy/widgets/space_card.dart';
import 'package:cozy/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor,
      body: SafeArea(
          bottom: false,
          child: ListView(
            children: [
              SizedBox(
                height: margin,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Explore Now",
                  style: blackTextStyle.copyWith(fontSize: 24),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Mencari Kosan yang cozy",
                  style: greyTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //NOTE: POPULAR CITIES
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Popular Cities",
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    CityCard(City(
                        id: 1,
                        name: "Jakarta",
                        imageUrl: "assets/images/Home/pic.png",
                        isPopular: false)),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                        id: 1,
                        name: "Bandung",
                        imageUrl: "assets/images/Home/pic-1.png",
                        isPopular: true)),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                        id: 1,
                        name: "Yogyakarta",
                        imageUrl: "assets/images/Home/pic-2.png",
                        isPopular: true)),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                        id: 1,
                        name: "Palembang",
                        imageUrl: "assets/images/Home/image 23.png",
                        isPopular: false)),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                        id: 1,
                        name: "Aceh",
                        imageUrl: "assets/images/Home/image 24.png",
                        isPopular: true)),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                        id: 1,
                        name: "Bogor",
                        imageUrl: "assets/images/Home/image 9-1.png",
                        isPopular: false)),
                    SizedBox(
                      width: 24,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //NOTE: RECOMMENDED SPACE
              Padding(
                padding: EdgeInsets.symmetric(horizontal: margin),
                child: Text(
                  "Recommended Space",
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: margin),
                  child: FutureBuilder(
                    future: spaceProvider.getRecommendedSpaces(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List<Space> data = snapshot.data;
                        print(data[1].address);
                        int index = 0;
                        return Column(
                          children: data.map((item) {
                            index++;
                            return Container(
                              margin: EdgeInsets.only(top: index == 1 ? 0 : 30),
                              child: SpaceCard(item),
                            );
                          }).toList(),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      );
                    },
                  )),
              SizedBox(
                height: 30,
              ),
              //NOTE: TIPS & GUIDANCE
              Padding(
                padding: EdgeInsets.symmetric(horizontal: margin),
                child: Text(
                  "Tips & Guidance",
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: margin),
                child: Column(
                  children: [
                    TipsCard(Tips(
                        id: 0,
                        imageUrl: "assets/images/Home/icon.png",
                        title: "City Guidlines",
                        updatedAt: "12 April")),
                    SizedBox(
                      height: 20,
                    ),
                    TipsCard(Tips(
                        id: 0,
                        imageUrl: "assets/images/Home/icon-1.png",
                        title: "Jakarta Fairship",
                        updatedAt: "11 Dec")),
                  ],
                ),
              ),
              SizedBox(
                height: 70 + margin,
              ),
            ],
          )),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * margin),
        margin: EdgeInsets.symmetric(horizontal: margin),
        decoration: BoxDecoration(
            color: Color(0xffF6F7F8), borderRadius: BorderRadius.circular(23)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: "assets/images/Icons/Icon_home_solid.png",
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: "assets/images/Icons/Icon_mail_solid.png",
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: "assets/images/Icons/Icon_card_solid.png",
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: "assets/images/Icons/Icon_love_solid.png",
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
